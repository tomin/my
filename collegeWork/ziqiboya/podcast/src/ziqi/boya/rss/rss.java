package ziqi.boya.rss;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.UnavailableException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndContentImpl;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndEntryImpl;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.feed.synd.SyndFeedImpl;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SyndFeedOutput;
 
/**
* Sample Servlet that serves a feed created with Rome.
* <p>
* The feed type is determined by the 'type' request parameter, if the parameter is missing it defaults
* to the 'default.feed.type' servlet init parameter, if the init parameter is missing it defaults to 'atom_0.3'
* <p>
* @author Alejandro Abdelnur
*
*/
public class rss extends HttpServlet {
 

	private static final long serialVersionUID = 1L;
	private static final String DEFAULT_FEED_TYPE = "default.feed.type";
    private static final String FEED_TYPE = "type";
    private static final String MIME_TYPE = "text/html; charset=utf-8";//�]�m��X��type
    private static final String COULD_NOT_GENERATE_FEED_ERROR = "Could not generate feed";
 
    private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";//�ɶ��榡
 
    private String _defaultFeedType;
 
    public void init() {
        _defaultFeedType = getServletConfig().getInitParameter(DEFAULT_FEED_TYPE);
        _defaultFeedType = (_defaultFeedType!=null) ? _defaultFeedType : "rss_2.0";
    }
 
    public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException {
				
        try {
			String username = (String)req.getParameter("user");
			String feedType = req.getParameter(FEED_TYPE);
            feedType = (feedType!=null) ? feedType : _defaultFeedType;
            
            //���ofeed!!
            SyndFeed feed = getFeed(req, username);	
			
            //�]�wfeed
            feed.setFeedType(feedType);
			feed.setEncoding("utf-8"); 
            res.setContentType(MIME_TYPE);			
			res.setCharacterEncoding("utf-8");
			
			//��Xfeed
			SyndFeedOutput output = new SyndFeedOutput();

			//xml�����|
			/**** ��X���ɮ�
			* ServletContext con= this.getServletContext(); 
			* String path=con.getRealPath("");
			* path = path+"\\rss\\"+username+".xml";			
			* Writer writer = new FileWriter(path);
			
			* output.output(feed,writer);
			* writer.close();
			*/
			
			PrintWriter out = res.getWriter();
			output.output(feed,out);
			//res.sendRedirect("./rss/"+username+".xml");
			
		    }
        catch (FeedException ex) {
            String msg = COULD_NOT_GENERATE_FEED_ERROR;
            log(msg,ex);
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,msg);
        }	
		
    }
 
    protected SyndFeed getFeed(HttpServletRequest req, String username) throws IOException,FeedException,ServletException {
        DateFormat dateParser = new SimpleDateFormat(DATE_FORMAT);
		String view = (String)req.getParameter("view");//�ϥΨ���view�A�|�M�w�ϥΨ���sql�y�k
 		//String username = (String)req.getParameter("user");
		//System.out.println("hello"+username);
        SyndFeed feed = new SyndFeedImpl();
        
		// �qpath.properties�ɤ����o�ϥΪ̮ڥؿ�
		ResourceBundle bundle;
	    bundle = ResourceBundle.getBundle("path");
	    String site_url = bundle.getString("site-url");//�ӷ��O- �ܼƬO_		

	    // �qdb.properties�ɤ����o�ϥΪ̮ڥؿ�
	    bundle = ResourceBundle.getBundle("db");
	    String driver = bundle.getString("driver");
	    String url = bundle.getString("url");
	    String db_user = bundle.getString("user");
	    String db_password = bundle.getString("password");
        		
		//����feed ���y�z
		if(username==null){
			feed.setTitle("Ziqi Boya - �Ʀ�]");
			if(view.equals("1"))
				feed.setTitle("Ziqi Boya - �̪��ť");			
			if(view.equals("2"))
				feed.setTitle("Ziqi Boya - �̪�W��");
			if(view.equals("3"))			 
				feed.setTitle("Ziqi Boya - �̪�̷R");
			if(view.equals("4"))			 
				feed.setTitle("Ziqi Boya - �̪����");				
		}else{
			feed.setTitle("Ziqi Boya - " + username);
			if(view.equals("1"))
				feed.setTitle("Ziqi Boya - " + username + " - �̪��ť");			
			if(view.equals("2"))
				feed.setTitle("Ziqi Boya - " + username + " -�̪�W��");
			if(view.equals("3"))			 
				feed.setTitle("Ziqi Boya - " + username + " - �̪�̷R");
			if(view.equals("4"))			 
				feed.setTitle("Ziqi Boya - " + username + " - �̪����");				
			
		}
        feed.setLink(site_url);
        feed.setDescription("�w��ϥ�Ziqi Boya�I");
 
		
        List<SyndEntry> entries = new ArrayList<SyndEntry>();//��ܦh��ƪ��}�C
        SyndEntry entry;//��r�s��
		//SyndImage image;//�Ϥ�
        SyndContent description;
 
		///////////�q��Ʈw�����
		try{
			String connect_url= url + "?user=" + db_user + "&password=" + db_password + "&useUnicode=true&characterEncoding=utf-8";
			req.setCharacterEncoding("utf-8");
			Class.forName(driver).newInstance();
			Connection con = DriverManager.getConnection(connect_url);
			
			Statement stmt = con.createStatement();
			String sql=null;
			
			//�ӤH�d��
			if(username!=null){
				//�̪��ť
				if(view.equals("1"))
					sql = "select s.song_id,title,artist,album,username,last_played,content from played_song p join song s on s.song_id=p.song_id join user u on u.user_id=s.user_id join comment c on c.song_id=s.song_id where p.user_id=(select user_id from user where username='" + username +"')  order by last_played desc limit 20 ";    
				//�̪�W��
				if(view.equals("2"))
					sql = "select s.song_id,title,artist,album,username,upload_time,content from song s natural join user join comment c on c.song_id=s.song_id where s.user_id=(select user_id from user where username='"+ username + "') order by upload_time desc limit 20";
				//�̪�̷R
				if(view.equals("3"))
					sql = "select s.song_id,title,artist,album,username,upload_time,content from song s natural join user u join fav_song f on s.song_id=f.song_id join comment c on c.song_id=s.song_id where f.user_id=(select user_id from user where username='"+ username + "')  limit 20";
				//�̪����
				if(view.equals("4"))
					sql = "select s.song_id,title,artist,album,username,upload_time,content,sum(sx)/count(*)*sum(cy) from (SELECT B.user_id,B.song_id,SUM( B.played_times) sx, COUNT( B.played_times) cx, COUNT( C.song_id) cy FROM played_song B left JOIN fav_song C ON(B.user_id=C.user_ID AND B.song_id=C.song_id) group by B.user_id,B.song_id union SELECT C.user_id,C.song_id,SUM( B.played_times) sx, COUNT( B.played_times) cx, COUNT( C.song_id) cy FROM fav_song C left JOIN played_song B ON(B.user_id=C.user_ID AND B.song_id=C.song_id) group by C.user_id,C.song_id) AS n join song s on n.song_id=s.song_id join user u on u.user_id=s.user_id join comment c on c.song_id=s.song_id group by n.song_id having u.username='"+ username + "'  order by 8 desc limit 20";					
			}
			//�s��d��
			else{
				//�̪��ť
				if(view.equals("1"))
					sql = "select distinct(s.song_id),title,artist,album,username,last_played,content from played_song p join song s on s.song_id=p.song_id join user u on u.user_id=s.user_id join comment c on c.song_id=s.song_id  order by last_played desc limit 20 ";    
				//�̪�W��
				if(view.equals("2"))
					sql = "select distinct(s.song_id),title,artist,album,username,upload_time,content from song s natural join user join comment c on c.song_id=s.song_id  order by upload_time limit 20 ";
				//�̪�̷R
				if(view.equals("3"))
					sql = "select distinct(s.song_id),title,artist,album,username,upload_time,content from song s natural join user u join fav_song f on s.song_id=f.song_id join comment c on c.song_id=s.song_id limit 20";			
				//�̪����
				if(view.equals("4"))
					sql = "select s.song_id,title,artist,album,username,upload_time,content,sum(sx)/count(*)*sum(cy) from (SELECT B.user_id,B.song_id,SUM( B.played_times) sx, COUNT( B.played_times) cx, COUNT( C.song_id) cy FROM played_song B left JOIN fav_song C ON(B.user_id=C.user_ID AND B.song_id=C.song_id) group by B.user_id,B.song_id union SELECT C.user_id,C.song_id,SUM( B.played_times) sx, COUNT( B.played_times) cx, COUNT( C.song_id) cy FROM fav_song C left JOIN played_song B ON(B.user_id=C.user_ID AND B.song_id=C.song_id) group by C.user_id,C.song_id) AS n join song s on n.song_id=s.song_id join user u on u.user_id=s.user_id join comment c on c.song_id=s.song_id group by n.song_id order by 8 desc limit 20";
			}
			ResultSet rs = stmt.executeQuery(sql);
    
			while(rs.next()){

		        entry = new SyndEntryImpl();
		        entry.setTitle(rs.getString(3)+" - "+rs.getString(2));//�@�a+�q�W
		        entry.setLink(site_url+"song/info.do?s="+rs.getString(1));
		        entry.setPublishedDate(dateParser.parse(rs.getString(6)));
				
		        description = new SyndContentImpl();
		        description.setType("text/plain");
		        description.setValue(rs.getString(7));//�i�H��comment
		        entry.setDescription(description);
		        entries.add(entry);
				
				/*******   �Ϥ��񤣶ilist Q_Q   *******
				image = new SyndImageImpl();
			        image.setTitle(rs.getString(3)+" - "+rs.getString(2));
			        image.setLink("http://140.119.19.130:8080/ziqiboya/song/info.do?s="+rs.getString(1));
			        image.setUrl("http://140.119.19.130:8080/ziqiboya/user/"+rs.getString(5)+"/cover/c"+rs.getString(1)+"_75.jpg");
				entries.add(image);
				************************************/
			}
			rs.close();	
			stmt.close();
			con.close();
			

			}catch (ClassNotFoundException e) {
					 throw new UnavailableException("������J�X�ʵ{��");
			}catch (SQLException e) {
					   throw new UnavailableException("��Ʈw�s�u����");
			}catch (Exception e) {
					  System.out.println("�o�ͤF" + e + "�ҥ~");
		}				
		//////////////////
      
 
        feed.setEntries(entries);
 
        return feed;
    }
 
 
}