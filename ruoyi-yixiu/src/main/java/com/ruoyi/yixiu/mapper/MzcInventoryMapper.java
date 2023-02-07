package com.ruoyi.yixiu.mapper;

import java.util.List;
import com.ruoyi.yixiu.domain.MzcInventory;
import org.apache.ibatis.annotations.Param;

/**
 * 配件清单Mapper接口
 *
 * @author mmmmnd
 * @date 2023-02-07
 */
public interface MzcInventoryMapper
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
     * 删除配件清单
     *
     * @param inventoryId 配件清单主键
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcInventoryByInventoryId(@Param("inventoryId") Long inventoryId, @Param("deleteByName") String deleteByName);

    /**
     * 批量删除配件清单
     *
     * @param inventoryIds 需要删除的数据主键集合
     * @param deleteByName 删除者
     * @return 结果
     */
    public int deleteMzcInventoryByInventoryIds(@Param("inventoryIds") Long[] inventoryIds, @Param("deleteByName") String deleteByName);
}
