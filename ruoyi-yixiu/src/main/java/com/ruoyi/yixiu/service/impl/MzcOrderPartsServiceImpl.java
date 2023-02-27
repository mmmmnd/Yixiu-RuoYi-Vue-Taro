package com.ruoyi.yixiu.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;

import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcOrderPartsMapper;
import com.ruoyi.yixiu.domain.MzcOrderParts;
import com.ruoyi.yixiu.service.IMzcOrderPartsService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 订单配件Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-26
 */
@Service
public class MzcOrderPartsServiceImpl implements IMzcOrderPartsService
{
    @Autowired
    private MzcOrderPartsMapper mzcOrderPartsMapper;

    /**
     * 查询订单配件
     *
     * @param partsId 订单配件主键
     * @return 订单配件
     */
    @Override
    public MzcOrderParts selectMzcOrderPartsByPartsId(Long partsId)
    {
        return mzcOrderPartsMapper.selectMzcOrderPartsByPartsId(partsId);
    }

    /**
     * 查询订单配件列表
     *
     * @param mzcOrderParts 订单配件
     * @return 订单配件
     */
    @Override
    public List<MzcOrderParts> selectMzcOrderPartsList(MzcOrderParts mzcOrderParts)
    {
        return mzcOrderPartsMapper.selectMzcOrderPartsList(mzcOrderParts);
    }

    /**
     * 新增订单配件
     *
     * @param mzcOrderParts 订单配件
     * @return 结果
     */
    @Override
    public int insertMzcOrderParts(MzcOrderParts mzcOrderParts)
    {
        mzcOrderParts.setCreateTime(DateUtils.getNowDate());
        mzcOrderParts.setCreateBy(getUsername());
        return mzcOrderPartsMapper.insertMzcOrderParts(mzcOrderParts);
    }

    /**
     * 修改订单配件
     *
     * @param mzcOrderParts 订单配件
     * @return 结果
     */
    @Override
    public int updateMzcOrderParts(MzcOrderParts mzcOrderParts)
    {
        mzcOrderParts.setUpdateTime(DateUtils.getNowDate());
        mzcOrderParts.setUpdateBy(getUsername());
        return mzcOrderPartsMapper.updateMzcOrderParts(mzcOrderParts);
    }

    /**
     * 批量删除订单配件
     *
     * @param partsIds 需要删除的订单配件主键
     * @return 结果
     */
    @Override
    public int deleteMzcOrderPartsByPartsIds(Long[] partsIds)
    {
        String deleteByName = getUsername();
        return mzcOrderPartsMapper.deleteMzcOrderPartsByPartsIds(partsIds,deleteByName);
    }

    /**
     * 删除订单配件信息
     *
     * @param partsId 订单配件主键
     * @return 结果
     */
    @Override
    public int deleteMzcOrderPartsByPartsId(Long partsId)
    {
        String deleteByName = getUsername();
        return mzcOrderPartsMapper.deleteMzcOrderPartsByPartsId(partsId,deleteByName);
    }

    /**
     * 批量新增配件
     *
     * @param mzcPartsList 订单配件
     * @param feedbackId   反馈单id
     */
    @Override
    @Transactional
    public void batchMzcParts(List<MzcOrderParts> mzcPartsList, Long feedbackId) {
        if (StringUtils.isNotEmpty(mzcPartsList)){
            List<MzcOrderParts> list = new ArrayList<>();

            for (MzcOrderParts mzcPartsItem:mzcPartsList) {
                mzcPartsItem.setFeedbackId(feedbackId);
                mzcPartsItem.setCreateBy(getUsername());
                mzcPartsItem.setCreateTime(DateUtils.getNowDate());
                list.add(mzcPartsItem);
            }

            if (list.size() > 0){
                mzcOrderPartsMapper.batchInsertMzcParts(list);
            }
        }
    }

    /**
     * 批量修改配件
     *
     * @param mzcPartsList 订单配件
     */
    @Override
    @Transactional
    public void batchUpdateMzcParts(List<MzcOrderParts> mzcPartsList) {
        if (StringUtils.isNotEmpty(mzcPartsList)){
            List<MzcOrderParts> list = new ArrayList<>();

            for (MzcOrderParts mzcPartsItem:mzcPartsList) {
                mzcPartsItem.setUpdateBy(getUsername());
                mzcPartsItem.setUpdateTime(DateUtils.getNowDate());
                list.add(mzcPartsItem);
            }

            if (list.size() > 0){
                mzcOrderPartsMapper.batchUpdateMzcParts(list);
            }
        }
    }
}
