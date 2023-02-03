package com.ruoyi.yixiu.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.yixiu.domain.MzcEquipment;
import com.ruoyi.yixiu.domain.MzcScrap;
import com.ruoyi.yixiu.mapper.MzcEquipmentMapper;
import com.ruoyi.yixiu.mapper.MzcScrapMapper;
import com.ruoyi.yixiu.service.IMzcScrapService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static com.ruoyi.common.utils.SecurityUtils.getUsername;

/**
 * 报废申请Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-01-30
 */
@Service
public class MzcScrapServiceImpl implements IMzcScrapService
{
    @Autowired
    private MzcScrapMapper mzcScrapMapper;

    @Resource
    private MzcEquipmentMapper mzcEquipmentMapper;

    /**
     * 查询报废申请
     *
     * @param scrapId 报废申请主键
     * @return 报废申请
     */
    @Override
    public MzcScrap selectMzcScrapByScrapId(Long scrapId)
    {
        /*获取报废列表*/
        List<MzcEquipment> mzcEquipmentList = mzcEquipmentMapper.selectMzcScrapByScrapId(scrapId);

        if (StringUtils.isNotEmpty(mzcEquipmentList)){
            MzcScrap mzcScrap = mzcScrapMapper.selectMzcScrapByScrapId(scrapId);
            mzcScrap.setEquipment(mzcEquipmentList);

            /*设备数量id*/
            List<Long> list = mzcScrap.getEquipment().stream().map(MzcEquipment::getEquipmentId).filter(Objects::nonNull).collect(Collectors.toList());
            mzcScrap.setEquipmentIds(list);
            return mzcScrap;
        }else{
            return null;
        }
    }

    /**
     * 查询报废申请列表
     *
     * @param mzcScrap 报废申请
     * @return 报废申请
     */
    @Override
    public List<MzcScrap> selectMzcScrapList(MzcScrap mzcScrap)
    {
        List<MzcScrap> mzcScrapList = mzcScrapMapper.selectMzcScrapList(mzcScrap);
        List<MzcScrap> scrapList = new ArrayList<>(mzcScrapList.size());

        for (MzcScrap scrap:mzcScrapList) {
            /*获取报废列表*/
            List<MzcEquipment> mzcEquipmentList = mzcEquipmentMapper.selectMzcScrapByScrapId(scrap.getScrapId());
            scrap.setEquipment(mzcEquipmentList);

            List<Long> list = scrap.getEquipment().stream().map(MzcEquipment::getEquipmentId).filter(Objects::nonNull).collect(Collectors.toList());
            scrap.setEquipmentIds(list);
            scrapList.add(scrap);
        }

        return scrapList;
    }

    /**
     * 新增报废申请
     *
     * @param mzcScrap 报废申请
     * @return 结果
     */
    @Override
    public int insertMzcScrap(MzcScrap mzcScrap)
    {
        mzcScrap.setCreateTime(DateUtils.getNowDate());
        mzcScrap.setNumber("FB" + DateUtils.getDateLite());
        mzcScrap.setCreateBy(getUsername());

        return mzcScrapMapper.insertMzcScrap(mzcScrap);
    }

    /**
     * 修改报废申请
     *
     * @param mzcScrap 报废申请
     * @return 结果
     */
    @Override
    public int updateMzcScrap(MzcScrap mzcScrap)
    {
        mzcScrap.setUpdateTime(DateUtils.getNowDate());
        mzcScrap.setUpdateBy(getUsername());

        return mzcScrapMapper.updateMzcScrap(mzcScrap);
    }

    /**
     * 批量删除报废申请
     *
     * @param scrapIds 需要删除的报废申请主键
     * @return 结果
     */
    @Override
    public int deleteMzcScrapByScrapIds(Long[] scrapIds)
    {
        String deleteByName = getUsername();

        return mzcScrapMapper.deleteMzcScrapByScrapIds(scrapIds,deleteByName);
    }

    /**
     * 删除报废申请信息
     *
     * @param scrapId 报废申请主键
     * @return 结果
     */
    @Override
    public int deleteMzcScrapByScrapId(Long scrapId)
    {
        String deleteByName = getUsername();
        return mzcScrapMapper.deleteMzcScrapByScrapId(scrapId,deleteByName);
    }
}
