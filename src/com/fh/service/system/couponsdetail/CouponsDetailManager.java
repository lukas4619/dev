package com.fh.service.system.couponsdetail;

import java.util.List;
import com.fh.entity.Page;
import com.fh.entity.system.CouponsDetail;
import com.fh.util.PageData;

/** 
 * 说明： 优惠券接口
 * 创建人：Lukas 18923798379
 * 创建时间：2016-09-01
 * @version
 */
public interface CouponsDetailManager{

	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception;
	
	/**新增关注
	 * @param pd
	 * @throws Exception
	 */
	public void insertSubscribe(PageData pd)throws Exception;
	
	
	/**批量新增
	 * @param pd
	 * @throws Exception
	 */
	public void batchSave(List<PageData> lp)throws Exception;
	
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception;
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception;
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	public List<PageData> list(Page page)throws Exception;
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> listAll(PageData pd)throws Exception;
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception;
	
	/**通过视图ID获取数据 
	 * @param pd
	 * @throws Exception
	 */
	public PageData findByViewId(PageData pd)throws Exception;
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception;
	
}

