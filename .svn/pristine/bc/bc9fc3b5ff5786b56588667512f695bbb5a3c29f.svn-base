package com.service.weixin;

import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.GoodsDAO;
import com.dao.HqlDAO;
import com.dao.MGuessDAO;
import com.dao.MSongsDAO;
import com.dao.UserinfoDAO;
import com.pojo.Goods;
import com.pojo.MGuess;
import com.pojo.MLevel;
import com.pojo.MSongs;
import com.pojo.Userinfo;

/*
 * 微信歌曲管理
 * @auth lgh
 */


@Service
public class MusicWeixinService {
	
	@Autowired
	private HqlDAO  hqldao;
	
	
	@Autowired
	private MSongsDAO  mSongsDAO;
	
	
	@Autowired
	private MGuessDAO mGuessDAO;
	
	
	@Autowired
	private GoodsDAO  goodsDAO;
	
	
	@Autowired
	private UserinfoDAO  userinfoDAO;
	
	/**
	 * 获取用户和商品获取 当前等级
	 * @param goodsId
	 * @param userid
	 * @return
	 */
	public float getCurrentZhekou(int goodsId, int userid)
	{
		String hql = "from MGuess g where g.goods.gid = ? and g.userinfo.usersId = ? order by  g.MSongs.MLevel.zhekou asc";
		List<MGuess> list = hqldao.pageQuery(hql, 1, 1, goodsId,userid);
		if (list.size()>0)
		{
			MGuess guess = list.get(0);
			MSongs songs = guess.getMSongs();
			return songs.getMLevel().getZhekou();
		}
		
		
		return 1;
		
		
		
	}
	
	
	/**
	 * 获取用户和商品获取 当前等级
	 * @param goodsId
	 * @param userid
	 * @return
	 */
	public MLevel getCurrentDenji(int goodsId, int userid)
	{
		String hql = "from MGuess g where g.goods.gid = ? and g.userinfo.usersId = ? order by  g.MSongs.MLevel.zhekou asc";
		List<MGuess> list = hqldao.pageQuery(hql, 1, 1, goodsId,userid);
		if (list.size()>0)
		{
			MGuess guess = list.get(0);
			MSongs songs = guess.getMSongs();
			return songs.getMLevel();
		}
		
		//找不到，就用最低折扣那个等级
		hql  = "from MLevel order by zhekou desc where status=1 ";
		List list2 = hqldao.pageQuery(hql, 1, 1);
		if (list2.size()>0)
			return (MLevel) list2.get(0);
		
		return null;
		
		
		
	}
	
    public Userinfo findUserById(int uid)
    {
    	return userinfoDAO.findById(uid);
    }
	
	
	/**
	 * 获取下一个等级
	 * @param goodsId
	 * @param userid
	 * @return
	 */
	public MLevel getNextDenji(int goodsId,int userid)
	{
		
		String hql = "from MGuess g where g.goods.gid = ? and g.userinfo.usersId = ? order by  g.MSongs.MLevel.zhekou asc";
		List<MGuess> list = hqldao.pageQuery(hql, 1, 1, goodsId,userid);
		if (list.size()>0)
		{
			MGuess guess = list.get(0);
			MSongs songs = guess.getMSongs();
			float zhenkou = songs.getMLevel().getZhekou();
			System.out.println("old:"+zhenkou);
			hql  = "from MLevel  where status=1 and  zhekou<? order by zhekou desc ";
			List list3 = hqldao.pageQuery(hql, 1, 1,zhenkou-0.001F);
			if (list3.size()>0)
			{	
				
				MLevel  m = (MLevel) list3.get(0);
			    float zhenkou2 = m.getZhekou();
			    System.out.println("newzhekou:"+zhenkou2);
			    return m;
			}
			
			return null;
		}
		
		//找不到，就用最低折扣那个等级
		hql  = "from MLevel order by zhekou desc where status=1 ";
		List list2 = hqldao.pageQuery(hql, 1, 1);
		if (list2.size()>0)
			return (MLevel) list2.get(0);
		
		return null; //数据库里面没有添加等级 
	}
   
	
	/**
	 * 更新用户的商品等级
	 * @param userid
	 * @param goodsid
	 * @param musicid
	 */
	public void updateMusicDenji(int userid, int goodsid, int musicid)
	{
		String hql = "from MGuess g where g.goods.gid = ? and g.userinfo.usersId = ? order by  g.MSongs.MLevel.zhekou asc";
		List<MGuess> list = hqldao.pageQuery(hql, 1, 1, goodsid,userid);
		MGuess guess = null;
	    if (list.size()>0)
	    {
	    	guess = list.get(0);
	    	
	    	
	    }
	    else //找不到添加新
		{
			guess = new MGuess();
			Userinfo  userinfo =userinfoDAO.findById(userid);
	    	Goods   goods = goodsDAO.findById(goodsid);
	    	guess.setUserinfo(userinfo);
	    	guess.setGoods(goods);
	    	
		}
	    guess.setTime(new Timestamp(System.currentTimeMillis()));
	    MSongs mSongs = mSongsDAO.findById(musicid);
	    guess.setMSongs(mSongs);
	    
	    mGuessDAO.merge(guess);
	    
	    
	}
	
	/**
	 * 随机取某个等级歌曲
	 * @param denji
	 * @return
	 */
	public MSongs  randomMusic(int denji)
	{
		String hql = "select count(*) from MSongs s where s.MLevel.id = ?";
		int sum  = (int) hqldao.unique(hql, denji);
		if (sum==0)
			return null;
		
		int n = new Random().nextInt(sum);
		
		hql  = "from MSongs s where s.MLevel.id = ?";
		List list = hqldao.pageQuery(hql, 1, n+1, denji);
		if (list.size()>0)
			return (MSongs) list.get(0);
		
		return null;
		
	}

}







