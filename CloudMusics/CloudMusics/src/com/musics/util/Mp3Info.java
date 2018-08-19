package com.musics.util;


import org.jaudiotagger.audio.mp3.MP3AudioHeader;
import org.jaudiotagger.audio.mp3.MP3File;
import org.jaudiotagger.tag.id3.AbstractID3v2Frame;
import org.jaudiotagger.tag.id3.AbstractID3v2Tag;
import org.jaudiotagger.tag.id3.framebody.FrameBodyAPIC;

public class Mp3Info {
	private static MP3File mp3File;
	private static final int START = 6;
	
	public Mp3Info(String mp3Path) {
		try {
			mp3File = new MP3File(mp3Path);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getHead() {
		System.out.println("----------------Loading...Head-----------------");
		MP3AudioHeader header = mp3File.getMP3AudioHeader();
		System.out.println("时长: " + header.getTrackLength());
		System.out.println("比特率: " + header.getBitRate());
		System.out.println("音轨长度: " + header.getTrackLength());
		System.out.println("格式: " + header.getFormat());
		System.out.println("声道: " + header.getChannels());
		System.out.println("采样率: " + header.getSampleRate());
		System.out.println("MPEG: " + header.getMpegLayer());
		System.out.println("MP3起始字节: " + header.getMp3StartByte());
		System.out.println("精确的音轨长度: " + header.getPreciseTrackLength());
	}

	public String getContent() {
		String songName = mp3File.getID3v2Tag().frameMap.get("TIT2").toString();
		String singer = mp3File.getID3v2Tag().frameMap.get("TPE1").toString();
		String author = mp3File.getID3v2Tag().frameMap.get("TALB").toString();
		return songName.substring(START,songName.length()-3)+","+
				singer.substring(START,singer.length()-3)+","+
				author.substring(START,author.length()-3);
		//System.out.println("歌名"+songName.substring(START,songName.length()-3));
		//System.out.println("歌手"+singer.substring(START,singer.length()-3));
		//System.out.println("专辑"+author.substring(START,author.length()-3));
		//System.out.println("All Info：" + mp3File.displayStructureAsPlainText());
	}

	public byte[] getImg(){
		AbstractID3v2Tag tag = mp3File.getID3v2Tag();
		AbstractID3v2Frame frame = (AbstractID3v2Frame) tag.getFrame("APIC");
		FrameBodyAPIC body = (FrameBodyAPIC) frame.getBody();
		byte[] imageData = body.getImageData();
		return imageData;
//		Image img = Toolkit.getDefaultToolkit().createImage(imageData, 0, imageData.length);
//		ImageIcon icon = new ImageIcon(img);
		//FileOutputStream fos = new FileOutputStream("D://test1.jpg");
		//fos.write(imageData);
		//fos.close();

//		System.out.println("width:" + icon.getIconWidth());
//		System.out.println("height:" + icon.getIconHeight());

		//控制台显示图片
//		JFrame f = new JFrame();
//		JLabel l = new JLabel();
//		l.setIcon(icon);
//		l.setVisible(true);
//		f.add(l);
//		f.setSize(400, 400);
//		f.setVisible(true);
	}
}
