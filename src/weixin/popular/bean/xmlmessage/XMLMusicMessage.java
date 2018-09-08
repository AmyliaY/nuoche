package weixin.popular.bean.xmlmessage;

public class XMLMusicMessage extends XMLMessage{
	
	private String title;
	
	private String description;
	
	private String musicUrl;
	
	private String hQMusicUrl;
	
	private String thumbMediaId;

	/**
	 * 
	 * @param toUserName
	 * @param fromUserName
	 * @param title			[可以为空]
	 * @param description	[可以为空]
	 * @param musicUrl		[可以为空] 音乐链接
	 * @param hQMusicUrl	[可以为空] 高质量音乐链接，WIFI环境优先使用该链接播放音乐
	 * @param thumbMediaId	缩略图的媒体id，通过上传多媒体文件，得到的id
	 */
	public XMLMusicMessage(String toUserName, String fromUserName,
			String title,String description,String musicUrl,String hQMusicUrl,String thumbMediaId) {
		super(toUserName, fromUserName, "music");
		this.title = title;
		this.description = description;
		this.musicUrl = musicUrl;
		this.hQMusicUrl = hQMusicUrl;
		this.thumbMediaId = thumbMediaId;
	}


	@Override
	public String subXML() {
		StringBuilder sb = new StringBuilder();
		sb.append("<Music>");
		sb.append("<Title><![CDATA["+(title==null?"":title)+"]]></Title>");
		sb.append("<Description><![CDATA["+(description==null?"":description)+"]]></Description>");
		sb.append("<MusicUrl><![CDATA["+(musicUrl==null?"":musicUrl)+"]]></MusicUrl>");
		sb.append("<HQMusicUrl><![CDATA["+(hQMusicUrl==null?"":hQMusicUrl)+"]]></HQMusicUrl>");		
		sb.append("<ThumbMediaId><![CDATA["+thumbMediaId+"]]></ThumbMediaId>");
		sb.append("</Music>");
		return sb.toString();
	}

	
}
