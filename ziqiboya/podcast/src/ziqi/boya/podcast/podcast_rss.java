package ziqi.boya.podcast;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;

import com.sun.syndication.feed.rss.Enclosure;
import com.sun.syndication.feed.synd.SyndContent;
import com.sun.syndication.feed.synd.SyndContentImpl;
import com.sun.syndication.feed.synd.SyndEnclosure;
import com.sun.syndication.feed.synd.SyndEnclosureImpl;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndEntryImpl;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.feed.synd.SyndFeedImpl;
import com.sun.syndication.io.FeedException;
import com.sun.syndication.io.SAXBuilder;
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
public class podcast_rss extends HttpServlet {
 

	private static final long serialVersionUID = 1L;
	private static final String DEFAULT_FEED_TYPE = "default.feed.type";
    private static final String FEED_TYPE = "type";
    private static final String MIME_TYPE = "text/html; charset=utf-8";//�]�m��X��type
    private static final String COULD_NOT_GENERATE_FEED_ERROR = "Could not generate feed";
    
     
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
            
            //�C�L�]�w
            res.setContentType(MIME_TYPE);			
			res.setCharacterEncoding("utf-8");            
            PrintWriter out = res.getWriter();
            
            //���ofeed!!
            SyndFeed feed = getFeed(req, res, username);
            
//			if(feed==null)out.print("null");
//			else out.print("not null");
			
            //�]�wfeed
            feed.setFeedType(feedType);
			feed.setEncoding("utf-8"); 

			
			//��Xfeed
			SyndFeedOutput output = new SyndFeedOutput();

			//xml�����|
			//��X���ɮ�
/*			ServletContext con= this.getServletContext(); 
			String path=con.getRealPath("");
			path = path+"\\rss\\"+username+".xml";			
			Writer writer = new FileWriter(path);
			
			output.output(feed,writer);
			writer.close();*/
			
			
			//�����L�X��						
			//out.print(feed);
			output.output(feed,out);
			//res.sendRedirect("./rss/"+username+".xml");
			
		    }
        catch (FeedException ex) {
            String msg = COULD_NOT_GENERATE_FEED_ERROR;
            log(msg,ex);
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,msg);
        } catch (JDOMException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
    }
 
    protected SyndFeed getFeed(HttpServletRequest req, HttpServletResponse res, String username) throws IOException,FeedException,ServletException, JDOMException {
                
        SyndFeed feed = new SyndFeedImpl();
        //PrintWriter out = res.getWriter();
		//�qpath.properties�ɤ����o�ϥΪ̮ڥؿ�
		ResourceBundle bundle;
	    bundle = ResourceBundle.getBundle("path");
	    String site_url = bundle.getString("site-url");//�ӷ��O- �ܼƬO_        
	    String podcast = bundle.getString("podcast");
	    String podcast_mp3 = bundle.getString("podcast_mp3");
	    
		//����feed ���y�z
		feed.setTitle("Ziqi Boya - "+ username + " - Podcast");
        feed.setLink(site_url);
        feed.setDescription("�w��ϥ�Ziqi Boya Podcast�I");
 
	  	String path=podcast+username+"/"+username+".xml";
		FileInputStream fi = new FileInputStream(path);		

		SAXBuilder sb = new SAXBuilder(false);
		Document doc = sb.build(fi);
		Element root = doc.getRootElement(); // �o��ڤ���
		Element trackListEl = root.getChild("trackList"); // �o��ڤ�����trackList�`�I
		List trackEls = trackListEl.getChildren();// �o��trackList���Ҧ�track�l����
		Element track = null;// �Ψө��ª�track����

		
        List<SyndEntry> entries = new ArrayList<SyndEntry>();//��ܦh��ƪ��}�C

        
        for (int i = 0; i < trackEls.size(); i++) {// ���X�Ҧ�track
        	
            SyndEntry entry = new SyndEntryImpl();            
            SyndContent description = new SyndContentImpl();        	
        	track = (Element) trackEls.get(i); // �o��Ӥ���
        	
	        entry.setTitle(track.getChild("title").getText());
	        entry.setLink(podcast_mp3+username+"/source/"+track.getChild("title").getText());
	        description.setType("text/plain");
	        description.setValue("");//�i�H��comment
	        entry.setDescription(description);

	        
	        List<SyndEnclosure> lstEnc = new Vector<SyndEnclosure> ();
	        SyndEnclosure enc = new SyndEnclosureImpl();
	        enc.setUrl(podcast_mp3+username+"/source/"+track.getChild("title").getText());
	        enc.setType("audio/mpeg");
	        enc.setLength(trackEls.size());
	        
	        lstEnc.add(enc);
	        entry.setEnclosures(lstEnc);
	        
	        //out.print(enc+"1234<br/>");
	        //out.print(lstEnc+"<br/>");
	        
	        entries.add(entry);	
		
	    }		
        
        //out.print(entries);

        feed.setEntries(entries);
 
        return feed;
    }
 
 
}