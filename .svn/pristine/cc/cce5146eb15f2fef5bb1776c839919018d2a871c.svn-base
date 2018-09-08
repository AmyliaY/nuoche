package com.service.back;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.MLevelDAO;
import com.dao.MSongsDAO;
import com.pojo.MLevel;
import com.pojo.MSongs;
import com.util.StringUtil;

@Service
public class MusicBackService {
	@Autowired
	private HqlDAO hqldao;

	@Autowired
	private MLevelDAO mLevelDAO;
	
	@Autowired
	private MSongsDAO  mSongsDAO;

	/**
	 * 添加歌曲等级
	 * 
	 * @param level
	 */
	public void addDenji(MLevel level) {
		mLevelDAO.save(level);
	}

	/**
	 * 得所有等级
	 * 
	 * @return
	 */
	public List getAllDenji() {
		List list = mLevelDAO.findAll();
		return list;

	}

	/**
	 * 修改状态
	 * 
	 */
	public String updateStatus(String id) {

		MLevel mLevel = mLevelDAO.findById(Integer.parseInt(id));

		Integer status = mLevel.getStatus();
		if (status == null)
			status = 0;

		mLevel.setStatus(1 - status);

		mLevelDAO.merge(mLevel);

		return mLevel.getStatus().toString();

	}
	
	/**
	 * 根据主键查找等级
	 * @param id
	 * @return
	 */
	public MLevel findById(String id) {
		MLevel mLevel = mLevelDAO.findById(Integer.parseInt(id));
		return mLevel;
	}

	/**
	 * 修改等级 
	 * @param level
	 */
	public void updateDenji(MLevel level) {
		mLevelDAO.merge(level);
	}
	
	/**
	 * 
	 * @param denjiId 空则所有
	 * @param name    歌曲名称
	 * @param page    第几页 
	 * @param size    页大小
	 * @return
	 */
	public Map searchMusic(String denjiId,String name,int page, int size)
	{
		StringBuffer sb = new StringBuffer(" where 1=1 ");
		List listParam  = new ArrayList();
		if (StringUtil.isDigit(denjiId))
		{
			sb.append(" and MLevel.id=?");
			listParam.add(Integer.parseInt(denjiId));
			
		}
		
		if (StringUtil.isNotNull(name))
		{
			sb.append(" and name like ?");
			listParam.add("%"+name+"%");
			
		}
		
		String hqlSum = "select count(*) from MSongs "+sb.toString();
		int sum = (int) hqldao.unique(hqlSum,listParam.toArray());
	    if (sum==0) return new HashMap();
	    int count = sum%size==0 ? sum/size : sum/size +1;
		String hql = "from MSongs "+sb.toString();
		List list = hqldao.pageQuery(hql,  size,page, listParam.toArray());
		
		Map map = new HashMap();
		map.put("list", list);
		map.put("sum", sum);
		map.put("count", count);
		map.put("page", page);
		
		return map;
	}

	/**
	 * 新增歌曲
	 * @param name
	 * @param status
	 * @param denjiId
	 * @param file
	 */
	public void addMusic(String name, String status, String denjiId, String file) {
		MLevel level = findById(denjiId);
		MSongs songs = new MSongs();
		songs.setFilename(file);
		songs.setMLevel(level);
		songs.setName(name);
		songs.setStatus(Integer.parseInt(status));
		mSongsDAO.save(songs);
		
	}

	/**
	 * 修改歌曲状态
	 * @param id
	 * @return
	 */
	public String updateStatusByMusic(String id) {
		MSongs mSongs = mSongsDAO.findById(Integer.parseInt(id));

		Integer status = mSongs.getStatus();
		if (status == null)
			status = 0;

		mSongs.setStatus(1 - status);

		mSongsDAO.merge(mSongs);

		return mSongs.getStatus().toString();
	}

	/**
	 * 根据主键查找歌曲
	 * @param id
	 * @return
	 */
	public MSongs findMusicById(String id) {
		return mSongsDAO.findById(Integer.parseInt(id));
	}

	/**
	 * 修改歌曲
	 * @param mSongs
	 */
	public void updateMusic(MSongs mSongs) {
		mSongsDAO.merge(mSongs);
	}
	
	
	
}
