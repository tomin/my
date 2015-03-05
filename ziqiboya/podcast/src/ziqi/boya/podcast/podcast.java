package ziqi.boya.podcast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ResourceBundle;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.Attribute;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;


public class podcast extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public  final void doGet(HttpServletRequest request,HttpServletResponse response)
                                        throws ServletException,IOException
	{	
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("big5");
		response.setContentType("text/html;charset=big5");
		String CONFIG_BUNDLE_NAME = "path";
		String user = (String)request.getParameter("user");
		String radio = (String)request.getParameter("radio");
	
		
		if(user==null)user="tomin";
		if(radio==null)radio="�w�]�q�x";
		
		// �qpath.properties�ɤ����o�ϥΪ̮ڥؿ�
		ResourceBundle bundle;
	    bundle = ResourceBundle.getBundle(CONFIG_BUNDLE_NAME);
	    String AUDIO_ROOT = bundle.getString("audio-root");
		
		//�إߤ@��root�����A�ó]�䬰XML��󪺮ڤ���
		Element root = new Element("playlist");
		Document doc = new Document(root);
		root.setAttribute(new Attribute("version", "1"));

		//�إߤ����Ψ�l����
		Element trackList = new Element("trackList");
		Element track;

	    // Create a directory; all ancestor directories must exist
	    boolean success = new File(AUDIO_ROOT+user).mkdir();
	    if (!success) {
	        // Directory creation failed
	    }			

	    // Create a directory; all ancestor directories must exist
	    success = new File(AUDIO_ROOT+user+"/source").mkdir();
	    if (!success) {
	        // Directory creation failed
	    }		
		

		Vector<String> vDirList = new Vector<String>();
		File dir = new File(AUDIO_ROOT+user+"/source"); 
		String sDirList[] = dir.list();
		if (sDirList.length >0){
			for (int i =0; i < sDirList.length; i++){
				vDirList.add(sDirList[i]);
			}
		}

		for(int i=0; i<vDirList.size(); i++) {
			String sFileName = (String)vDirList.get(i);
		
			track = new Element("track");
			track.addContent(new Element("title").addContent(sFileName));
			track.addContent(new Element("creator").addContent(radio));
			track.addContent(new Element("location").addContent("./"+user+"/source/"+sFileName));
			track.addContent(new Element("info").addContent("http://tw.yahoo.com"));
			trackList.addContent(track);//����track�˶itracklist
		} 

		root.addContent(trackList);//�A�� tracklist�˶iroot

		//�ŧi�@��Format����ӱ�XML���ݩʭ�
		Format format = Format.getPrettyFormat();
		format.setEncoding("utf-8");

		//�Τ@��XMLOutputter�Ӭ��ڭ̿�XXML���
		XMLOutputter outputter = new XMLOutputter();
		outputter.setFormat(format);// ������]�w��Format�]��XMLOutputter	
		

		//�γo�Ӥ~���Xutf-8�榡���ɮסAFileWriter����
		OutputStream os1= new FileOutputStream(AUDIO_ROOT+user+"/"+user+".xml");
		OutputStreamWriter writer = new OutputStreamWriter(os1,"utf-8");		
		

		outputter.output(doc, writer);
		writer.close();
		
		//out.print(radio);
		response.sendRedirect("index.jsp?user="+user+"&radio="+radio);
	}

}
