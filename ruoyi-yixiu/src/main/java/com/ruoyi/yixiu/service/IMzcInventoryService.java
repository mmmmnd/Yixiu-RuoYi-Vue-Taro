package com.ruoyi.yixiu.service;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcInventory;

/**
 * 配件清单Service接口
 * 
 * @author mmmmnd
 * @date 2023-02-07
 */
public interface IMzcInventoryService 
{
    /**
     * 查询配件清单
     * 
     * @param inventoryId 配件清单主键
     * @return 配件清单
     */
    public MzcInventory selectMzcInventoryByInventoryId(Long inventoryId);

    /**
     * 查询配件清单列表
     * 
     * @param mzcInventory 配件清单
     * @return 配件清单集合
     */
    public List<MzcInventory> selectMzcInventoryList(MzcInventory mzcInventory);

    /**
     * 新增配件清单
     * 
     * @param mzcInventory 配件清单
     * @return 结果
     */
    public int insertMzcInventory(MzcInventory mzcInventory);

    /**
     * 修改配件清单
     * 
     * @param mzcInventory 配件清单
     * @return 结果
     */
    public int updateMzcInventory(MzcInventory mzcInventory);

    /**
     * 批量删除配件清单
     * 
     * @param inventoryIds 需要删除的配件清单主键集合
     * @return 结果
     */
    public int deleteMzcInventoryByInventoryIds(Long[] inventoryIds);

    /**
     * 删除配件清单信息
     * 
     * @param inventoryId 配件清单主键
     * @return 结果
     */
    public int deleteMzcInventoryByInventoryId(Long inventoryId);
}
