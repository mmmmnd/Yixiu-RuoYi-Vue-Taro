package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcPartsMapper;
import com.ruoyi.yixiu.domain.MzcParts;
import com.ruoyi.yixiu.service.IMzcPartsService;

/**
 * 配件申请Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-06
 */
@Service
public class MzcPartsServiceImpl implements IMzcPartsService
{
    @Autowired
    private MzcPartsMapper mzcPartsMapper;

    /**
     * 查询配件申请
     *
     * @param partsId 配件申请主键
     * @return 配件申请
     */
    @Override
    public MzcParts selectMzcPartsByPartsId(Long partsId)
    {
        return mzcPartsMapper.selectMzcPartsByPartsId(partsId);
    }

    /**
     * 查询配件申请列表
     *
     * @param mzcParts 配件申请
     * @return 配件申请
     */
    @Override
    public List<MzcParts> selectMzcPartsList(MzcParts mzcParts)
    {
        return mzcPartsMapper.selectMzcPartsList(mzcParts);
    }

    /**
     * 新增配件申请
     *
     * @param mzcParts 配件申请
     * @return 结果
     */
    @Override
    public int insertMzcParts(MzcParts mzcParts)
    {
        mzcParts.setCreateTime(DateUtils.getNowDate());
        mzcParts.setCreateBy(getUsername());
        return mzcPartsMapper.insertMzcParts(mzcParts);
    }

    /**
     * 修改配件申请
     *
     * @param mzcParts 配件申请
     * @return 结果
     */
    @Override
    public int updateMzcParts(MzcParts mzcParts)
    {
        mzcParts.setUpdateTime(DateUtils.getNowDate());
        mzcParts.setUpdateBy(getUsername());
        return mzcPartsMapper.updateMzcParts(mzcParts);
    }

    /**
     * 批量删除配件申请
     *
     * @param partsIds 需要删除的配件申请主键
     * @return 结果
     */
    @Override
    public int deleteMzcPartsByPartsIds(Long[] partsIds)
    {
        String deleteByName = getUsername();
        return mzcPartsMapper.deleteMzcPartsByPartsIds(partsIds,deleteByName);
    }

    /**
     * 删除配件申请信息
     *
     * @param partsId 配件申请主键
     * @return 结果
     */
    @Override
    public int deleteMzcPartsByPartsId(Long partsId)
    {
        String deleteByName = getUsername();
        return mzcPartsMapper.deleteMzcPartsByPartsId(partsId,deleteByName);
    }
}
