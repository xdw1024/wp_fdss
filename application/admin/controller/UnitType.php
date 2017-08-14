<?php
/**
 * 单位类型控制器
 *
 * @author  xdw
 * @date  20161129
 */
namespace app\admin\controller;

use app\admin\model\UnitInfoField as UnitInfoFieldModel;
use app\admin\model\UnitType as UnitTypeModel;
use app\admin\model\Unit as UnitModel;
use \think\Db;
use app\admin\model\AdminDepartment as AdminDepartmentModel;

/**
 * 单位控制器
 *
 * @author  xdw
 * @date  20161119
 */
class UnitType extends Common
{
    /**
     * 单位类型列表
     * @author xdw
     * @date 20161129
     */
    public function index()
    {
        $unit_type = new UnitTypeModel();
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $keyword = input('post.keyword');
        $currentPage = input('?post.pageNum')?input('post.pageNum'):1;

        $department_ids = get_admin_manage_department();
        $map['u.department_id'] = ['in',$department_ids];

        $totalCount =$unit_type->alias('u')->where('name','like','%'.$keyword.'%')->where($map)->count();
        $datalist=Db::view(['fds_unit_type'=>'u'])
            ->view(['fds_unit_type'=>'ut'],['name'=>'lasttype'],'u.parent_id = ut.id','LEFT')
            ->view(['fds_admin_department'=>'ua'],['name'=>'department'],'u.department_id = ua.id','LEFT')
            ->where('u.name','like','%'.$keyword.'%')
            ->where($map)
            ->order('u.path')
            ->page("$currentPage,$numPerPage")
            ->select();

        $this->assign('keyword',$keyword);
        $this->assign('datalist',$datalist);
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        return $this->fetch('unittype/index');
    }

    /**
     * 新增/编辑
     * @author xdw
     * @date 20161129
     */
    public function edit(){
        $unit_type_id = input('utid');
        $unit_type = new UnitTypeModel();
        $info = $unit_type->where("id='{$unit_type_id}'")->find();
        //$unit_type_info = $unit_type->select();

        $lasttypeinfo = $unit_type->where("id='{$info['parent_id']}'")->find();
        $lasttype = $lasttypeinfo['name'];
        if(empty($info['id'])){
            $unit_type_info = db('unit_type')->order('path')->select();
        }else{
            $unit_type_info = db('unit_type')->where("id not in(".$info['id'].")")->order('path')->select();
        }

        $admin_department = new AdminDepartmentModel();
        $department = $admin_department->select();
        $this->assign('department',$department);
        $this->assign('info',$info);
        $this->assign('lasttype',$lasttype);
        $this->assign('unit_type_info',$unit_type_info);
        return  $this->fetch('unittype/edit');
    }

    /**
     * 保存信息
     * @author xdw
     * @date 20161129
     */
    public function saveInfo(){
        $unit_type = new UnitTypeModel();
        $data = input('post.');
        $validate = true;
        if(true !== $validate)
        {
            $this->error($validate);
        }
        else
        {
            $unit_type_id = input('post.id');
            if ($unit_type_id > 0)//编辑
            {
                if(isset($_FILES["type_icon"]) && $_FILES["type_icon"]['name'] != '' ) {
                    $data['icon'] = $this->saveUnitTypeIcon();
                }
                //重新拼接路径，将新父类的路径与当前id拼接
                if($data['path'] == ''){
                    unset($data['path']);
                }
                else{
                    $data['path'] = $data['path'].'/'.$unit_type_id;
                }
                $result = $unit_type->allowField(true)->save($data,['id' => $unit_type_id]);
            }
            else//新增
            {
                $data['icon'] = $this->saveUnitTypeIcon();
                unset($data['id']);
                $unit_type->allowField(true)->isUpdate(false)->save($data);
                $new_unit_type_id = $unit_type->id;
                //路径拼接，将父类的路径与当前id拼接
                if($new_unit_type_id){
                    $data_path['path'] = $data['path'].'/'.$new_unit_type_id;
                    $result = db('unit_type')->where('id',$new_unit_type_id)->update($data_path);
                }
            }

            if (false !== $result) {
                success('保存成功', 'unit_type_list', 'closeCurrent');
            } else {
                failure('保存失败');
            }
        }
    }

    /**
     * 保存单位类型图片
     * @return string
     */
    private function saveUnitTypeIcon(){

        $file_name = '';

        if(isset($_FILES["type_icon"])) {
            if ($_FILES["type_icon"]["error"] > 0) {
                failure('上传图标失败！');
                die();
            } else {
                $file = $_FILES['type_icon'];//类型图标文件
                $name = $file['name'];
                $type = strtolower(substr($name, strrpos($name, '.') + 1)); //后缀
                $allow_type = array('jpg', 'jpeg', 'gif', 'png');
                if (!in_array($type, $allow_type)) {
                    failure('请上传以下格式的图标：png/jpg/jpeg/git');
                    die();
                }
                $upload_path = UPLOAD_FOLDER."/Images/unit_type_icon/";
                $file_name = time().$file['name'];
                if (move_uploaded_file($file['tmp_name'], $upload_path . $file_name)) {
                    $file_name = "/unit_type_icon/".$file_name;
                }
            }
        }
        return $file_name;
    }
    /** end 保存单位类型图片 */

    /**
     * 信息删除
     * @author xdw
     * @date 20161129
     */
    public function removeInfo()
    {
        $unit_type_id = input('utid');
        $unit = new UnitModel();
        $flag = $unit->where('unit_type_id',$unit_type_id)->find();
        if($flag)
        {
            failure('拒绝删除！单位中还存在该类型的单位');
        }
        else
        {
            $unit_type = new UnitTypeModel();
            $result = $unit_type->where('id',$unit_type_id)->delete();
            if(false !== $result)
            {
                success('删除成功','unit_type_list','');
            }
            else
            {
                failure('删除失败！');
            }
        }
    }

    /**
     * 单位类型属性字段管理
     */
    public function fieldList(){
        $unit_type_id = input('param.unit_type_id');
        $datalist = db('unit_info_field')->where('unit_type_id',$unit_type_id)->order('sortorder')->select();

        $this->assign('unit_type_id',$unit_type_id);
        $this->assign('datalist',$datalist);

        return $this->fetch('unittype/fieldlist');
    }

    /**
     * 单位字段编辑
     */
    public function fieldEdit(){
        $field_id = input('fid');
        $unit_type_id = input('unit_type_id');
        $info = db('unit_info_field')->where("id",$field_id)->find();
        $this->assign('info',$info);
        $this->assign('unit_type_id',$unit_type_id);
        return  $this->fetch('unittype/fieldedit');
    }

    /**
     * 保存单位字段信息
     */
    public function saveFieldInfo(){
        $data = input('post.');
        $validate = true;
        if(true !== $validate)
        {
            $this->error($validate);
        }
        else
        {
            $field_id = input('post.id');
            $unitInfoField = new UnitInfoFieldModel();
            if ($field_id > 0)//编辑
            {
                $result = $unitInfoField->allowField(true)->save($data,['id' => $field_id]);
            }
            else//新增
            {
                $result = $unitInfoField->allowField(true)->isUpdate(false)->save($data);
            }

            if (false !== $result) {
                success('保存成功', 'field_manage', 'closeCurrent');
            } else {
                failure('保存失败');
            }
        }
    }

    /**
     * 删除单位字段信息
     */
    public function removeFieldInfo(){
        $field_id = input('fid');
        $unit_type = new UnitInfoFieldModel();
        $result_field = $unit_type->where('id',$field_id)->delete();
        $result_data = db('unit_info_data')->where('field_id',$field_id)->delete();
        if(false !== $result_field && false !== $result_data)
        {
            success('删除成功','field_manage','');
        }
        else
        {
            failure('删除失败！');
        }
    }
}