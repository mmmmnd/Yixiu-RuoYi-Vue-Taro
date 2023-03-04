package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcSinglepageMapper;
import com.ruoyi.yixiu.domain.MzcSinglepage;
import com.ruoyi.yixiu.service.IMzcSinglepageService;

/**
 * 单页Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-03-03
 */
@Service
public class MzcSinglepageServiceImpl implements IMzcSinglepageService
{
    @Autowired
    private MzcSinglepageMapper mzcSinglepageMapper;

    /**
     * 查询单页
     *
     * @param id 单页主键
     * @return 单页
     */
    @Override
    public MzcSinglepage selectMzcSinglepageById(Long id)
    {
        return mzcSinglepageMapper.selectMzcSinglepageById(id);
    }

    /**
     * 查询单页列表
     *
     * @param mzcSinglepage 单页
     * @return 单页
     */
    @Override
    public List<MzcSinglepage> selectMzcSinglepageList(MzcSinglepage mzcSinglepage)
    {
        return mzcSinglepageMapper.selectMzcSinglepageList(mzcSinglepage);
    }

    /**
     * 新增单页
     *
     * @param mzcSinglepage 单页
     * @return 结果
     */
    @Override
    public int insertMzcSinglepage(MzcSinglepage mzcSinglepage)
    {
        mzcSinglepage.setCreateTime(DateUtils.getNowDate());
        mzcSinglepage.setCreateBy(getUsername());
        return mzcSinglepageMapper.insertMzcSinglepage(mzcSinglepage);
    }

    /**
     * 修改单页
     *
     * @param mzcSinglepage 单页
     * @return 结果
     */
    @Override
    public int updateMzcSinglepage(MzcSinglepage mzcSinglepage)
    {
        mzcSinglepage.setUpdateTime(DateUtils.getNowDate());
        mzcSinglepage.setUpdateBy(getUsername());
        return mzcSinglepageMapper.updateMzcSinglepage(mzcSinglepage);
    }

    /**
     * 批量删除单页
     *
     * @param ids 需要删除的单页主键
     * @return 结果
     */
    @Override
    public int deleteMzcSinglepageByIds(Long[] ids)
    {
        String deleteByName = getUsername();
        return mzcSinglepageMapper.deleteMzcSinglepageByIds(ids,deleteByName);
    }

    /**
     * 删除单页信息
     *
     * @param id 单页主键
     * @return 结果
     */
    @Override
    public int deleteMzcSinglepageById(Long id)
    {
        String deleteByName = getUsername();
        return mzcSinglepageMapper.deleteMzcSinglepageById(id,deleteByName);
    }
}
