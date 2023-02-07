package com.ruoyi.yixiu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import static com.ruoyi.common.utils.SecurityUtils.getUsername;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.yixiu.mapper.MzcToolMapper;
import com.ruoyi.yixiu.domain.MzcTool;
import com.ruoyi.yixiu.service.IMzcToolService;

/**
 * 工具Service业务层处理
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
@Service
public class MzcToolServiceImpl implements IMzcToolService
{
    @Autowired
    private MzcToolMapper mzcToolMapper;

    /**
     * 查询工具
     *
     * @param toolId 工具主键
     * @return 工具
     */
    @Override
    public MzcTool selectMzcToolByToolId(Long toolId)
    {
        return mzcToolMapper.selectMzcToolByToolId(toolId);
    }

    /**
     * 查询工具列表
     *
     * @param mzcTool 工具
     * @return 工具
     */
    @Override
    public List<MzcTool> selectMzcToolList(MzcTool mzcTool)
    {
        return mzcToolMapper.selectMzcToolList(mzcTool);
    }

    /**
     * 新增工具
     *
     * @param mzcTool 工具
     * @return 结果
     */
    @Override
    public int insertMzcTool(MzcTool mzcTool)
    {
        mzcTool.setCreateTime(DateUtils.getNowDate());
        mzcTool.setCreateBy(getUsername());
        return mzcToolMapper.insertMzcTool(mzcTool);
    }

    /**
     * 修改工具
     *
     * @param mzcTool 工具
     * @return 结果
     */
    @Override
    public int updateMzcTool(MzcTool mzcTool)
    {
        mzcTool.setUpdateTime(DateUtils.getNowDate());
        mzcTool.setUpdateBy(getUsername());
        return mzcToolMapper.updateMzcTool(mzcTool);
    }

    /**
     * 批量删除工具
     *
     * @param toolIds 需要删除的工具主键
     * @return 结果
     */
    @Override
    public int deleteMzcToolByToolIds(Long[] toolIds)
    {
        String deleteByName = getUsername();
        return mzcToolMapper.deleteMzcToolByToolIds(toolIds,deleteByName);
    }

    /**
     * 删除工具信息
     *
     * @param toolId 工具主键
     * @return 结果
     */
    @Override
    public int deleteMzcToolByToolId(Long toolId)
    {
        String deleteByName = getUsername();
        return mzcToolMapper.deleteMzcToolByToolId(toolId,deleteByName);
    }
}
