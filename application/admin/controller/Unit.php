<?php
/**
 * 单位控制器
 *
 * @author  xdw
 * @date  20161119
 */

namespace app\admin\controller;

use app\admin\model\Unit as UnitModel;
use app\admin\model\UnitType as UnitTypeModel;
use app\admin\model\MyMap as MyMapModel;
use app\admin\model\UnitInfoData as UnitInfoDataModel;
use app\admin\model\UnitInfoField as UnitInfoFieldModel;
use think\Db;


/**
 * 单位控制器
 *
 * @author  xdw
 * @date  20161119
 */
class Unit extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        $this->unit = new UnitModel();
    }

    /**
     * 单位管理页面
     */
    public function index(){
        $unit_type_menu = $this->_getUnitTypeMenu();
        $this->assign('unit_type_menu',$unit_type_menu);
        return  $this->fetch('unit/index');
    }

    /**
     * 处理单位类型，判断是否为父类，用于树型结构输出
     * @return false|\PDOStatement|string|\think\Collection
     */
    private function _getUnitTypeMenu(){
        $unit_type_parents = db('unit_type')->distinct(true)->column('parent_id');

        $department_ids = get_admin_manage_department();
        $map['department_id'] = ['in',$department_ids];

        $unit_types = db('unit_type ut')->where($map)->order('path')->select();
        foreach ($unit_types as &$unit_type){
            $unit_type['parent_flag'] = in_array($unit_type['id'],$unit_type_parents) ? 1 : 0 ;
        }
        return $unit_types;
    }

    /**
     * 单位列表展示
     * @author xdw
     * @date 20170320
     */
    public function unitList(){
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $keyword = input('post.keyword');
        $currentPage = input('?post.pageNum')?input('post.pageNum'):1;
        $nowperPage = $numPerPage*($currentPage-1);

        $unit_type_id = input('?param.unit_type_id')?input('param.unit_type_id'):1;//单位类型
        $unitTypeName = input('?param.unit_type_name')?input('param.unit_type_name'):'';//单位类型名称
        $unitInfoFields = db('unit_info_field')->where('unit_type_id',$unit_type_id)->order('sortorder')->select();//单位表头字段

        //单位字段查询拼接
        $field_sql = 'unit_id,';
        foreach ($unitInfoFields as $field){
            $field_sql .= 'GROUP_CONCAT(CASE WHEN field_id = '.$field['id'].' THEN data ELSE null END) AS '.$field['short_name'].',';
        }
        $field_sql = rtrim($field_sql,',');

        //查询语句拼接
        $sql = "SELECT ".$field_sql."
	      FROM fds_unit_info_data where  
	      unit_id in(select id from fds_unit where unit_type_id = ".$unit_type_id." and `name` like '%".$keyword."%')
	      GROUP BY unit_id desc LIMIT ".$nowperPage.",".$numPerPage;
        $dataList = Db::query($sql);

        //总记录数
        $totalCount = db('unit')
            ->where('unit_type_id',$unit_type_id)
            ->where('name','like','%'.$keyword.'%')
            ->count();

        $this->assign('keyword',$keyword);
        $this->assign('dataList',$dataList);
        $this->assign('unitTypeId',$unit_type_id);
        $this->assign('unitTypeName',$unitTypeName);
        $this->assign('unitInfoFields',$unitInfoFields);
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        return  $this->fetch('unit/unitlist');
    }

    /**
     * 单位列表(废弃)
     *
     * @author  xdw
     * @date  20161119
     */
    public function index_old_01()
    {
        $unit_type = new UnitTypeModel();
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $utname = input('?post.utname')?input('post.utname'):'';//搜索类型
        $map = 'u.name like "%'.$keyword.'%"';
        if(!empty($utname)){
            $utype = $unit_type->where('name','like','%'.$utname.'%')->select();
            //var_dump($utype);exit;
            $maptyp = 'u.type = '.$utype['0']['id'];
        }else{
            $maptyp = 'u.type like "%%"';
        }

        $numPerPage = input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage = input('?post.pageNum')?input('post.pageNum'):1;
        $totalCount =$this->unit->where(''.$map.' and '.$maptyp.'')->alias('u')
            ->field('u.*,ut.name unittype')
            ->join('fds_unit_type ut','ut.id=u.type','LEFT')
            ->count();
        $datalist = $this->unit->where(''.$map.' and '.$maptyp.'')->alias('u')
            ->field('u.*,ut.name unittype')
            ->join('fds_unit_type ut','ut.id=u.type','LEFT')
            ->page("$currentPage,$numPerPage")
            ->order('id desc')
            ->select();
        $typelist = $unit_type->select();
        $this->assign('datalist',$datalist);
        $this->assign('typelist',$typelist);
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('keyword',$keyword);
        $this->assign('utname',$utname);
        return $this->fetch();
    }

    /**
     * 新增/编辑
     * @author xdw
     * @date 20170322
     */
    public function unitEdit(){
        $unit_type_id = input('?get.unit_type_id')?input('get.unit_type_id'):1;//单位类型id
        $unit_id = input('?get.uid')?input('get.uid'):'\'\'';//单位id

        //单位字段信息
        $sql = 'SELECT * FROM
                    (
                        SELECT ui.id,ui.short_name,ui.`name`,ui.data_type,ui.sortorder,ui.required FROM
                        fds_unit_info_field ui
                        WHERE ui.unit_type_id = '.$unit_type_id.'
                    ) as a
                    LEFT JOIN 
                    (
                        SELECT ui.field_id,ui.`data` FROM
                        fds_unit_info_data ui
                        WHERE ui.unit_id = '.$unit_id.'
                    ) as b
                    ON a.id = b.field_id
                    ORDER BY a.sortorder';
        $unit_field_and_datas = db::query($sql);
        $unit_coordinate = $this->unit->where("id='{$unit_id}'")->find();//单位坐标信息
        $zone = db('zone')->where('parent_id',1)->select();//区域信息

        $this->assign('unit_type_id',$unit_type_id);
        $this->assign('unitFieldDatas',$unit_field_and_datas);
        $this->assign('unitCoordinate',$unit_coordinate);
        $this->assign('zone',$zone);

        return  $this->fetch('unit/unitedit');
    }

    /**
     * 新增/编辑 （废弃）
     * @return mixed
     * @author xdw
     */
    public function edit()
    {
        $unit_id = input('uid');
        $info = $this->unit->where("id='{$unit_id}'")->find();
        $unit_type = new UnitTypeModel();//获取单位类型
        $unit_type_info = $unit_type->select();
        $this->assign('info',$info);
        $this->assign('unit_type_info',$unit_type_info);
        return  $this->fetch('unit/edit');
    }

    /**
     * 保存单位信息
     * @author xdw
     * @date  20170322
     */
    public function unitSaveInfo(){
        $data = input('post.');
        $unit_type_id = input('post.unit_type_id');
        $validate = true;
        $unitinfodata = new UnitInfoDataModel();

        if(true !== $validate)
        {
            $this->error($validate);
        }
        else
        {
            $unit_id = input('post.id');
            $unit_fields = db('unit_info_field')->where('unit_type_id',$unit_type_id)->order('id')->select();
            if(empty($unit_fields)){
                failure('保存失败，没有具体单位信息！');
                die();
            }

            if($unit_id>0)//编辑
            {
                //保存单位坐标信息
                $result = $this->unit->allowField(true)->save($data,['id'=>$unit_id]);

                //保存单位基础信息
                $update_info = array();
                foreach ($unit_fields as $field){
                    $temp_data = changeUnitInfoData_in($field['data_type'],$data[$field['short_name']]);
                    $unit_data = $unitinfodata->where('unit_id',$unit_id)->where('field_id',$field["id"])->find();//查询原有记录
                    if(empty($unit_data)){
                        $update_info[] = ['unit_id' => ''.$unit_id.'', 'field_id' => $field["id"],'data'=>''.$temp_data.''];
                    }else{
                        $update_info[] = ['id'=>$unit_data['id'],'unit_id' => ''.$unit_id.'', 'field_id' => $field["id"],'data'=>''.$temp_data.''];
                    }
                }
                $res_update = $unitinfodata->saveAll($update_info);//更新原有记录|新增记录

                if(false !== $result || false !== $res_update )
                {
                    success('保存成功','unit_listzxyy','closeCurrent');
                }
                else
                {
                    failure('保存失败！');
                }
            }
            else//新增
            {
                $data['create_time'] = time();
                $result = $this->unit->allowField(true)->save($data);//保存单位坐标信息

                $lastunit_id = Db::name('fds_unit')->getLastInsID();
                $datainfo = array();
                foreach ($unit_fields as $field){
                    $temp_data = changeUnitInfoData_in($field['data_type'],$data[$field['short_name']]);
                    $datainfo[] = ['unit_id' => ''.$lastunit_id.'', 'field_id' => $field["id"],'data'=>''.$temp_data.''];
                }
                $ress = Db::name('unit_info_data')->insertAll($datainfo);//保存单位基础信息

                if(false !== $result || false !== $ress)
                {
                    success('保存成功','unit_listxzyy','closeCurrent');
                }
                else
                {
                    failure('保存失败！');
                }
            }//end 新增
        }
    }

    /**
     * 删除单位信息
     * @author xdw
     * @date 20170322
     */
    public function unitDelete(){

        $unit_id = input('uid');
        $unitinfodata = new UnitInfoDataModel();
        $result = $this->unit->where('id',$unit_id)->delete();
        $res = $unitinfodata->where('unit_id',$unit_id)->delete();
        if(false !== $result || false !== $res)
        {
            success('删除成功','unit_listxzyy','');
        }
        else
        {
            failure('删除失败！');
        }
    }

    /**
     * 县镇医院列表
     * @return mixed
     * @author yxf
     */
    public function listxzyy()
    {
        $unitinfodata = new UnitInfoDataModel();
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $keyword = input('post.keyword');
        $currentPage = input('?post.pageNum')?input('post.pageNum'):1;
        $nowperPage = $numPerPage*($currentPage-1);
        //$dataCount = $unitinfodata->where('field_id','=',18)
        //    ->where('data','like','%'.$keyword.'%')
        //    ->where('unit_id','in',$sql_temp)
        //    ->select(false);

        $dataCount = Db::view('unit_info_data', '*')
            ->view('unit',['id' => 'un_id'], 'unit.id = unit_info_data.unit_id')
            ->where(['unit_info_data.field_id' => 18, 'unit.unit_type_id' => 18])
            ->where('unit_info_data.data','like','%'.$keyword.'%')
            ->select();
        $totalCount = count($dataCount);

        $datalist = Db::query("SELECT unit_id, 
	      GROUP_CONCAT(CASE WHEN  field_id = 18  THEN  data ELSE  null  END)   AS  organization_name,
	      GROUP_CONCAT(CASE WHEN  field_id = 19  THEN  data ELSE  null  END)   AS  addr,
	      GROUP_CONCAT(CASE WHEN  field_id = 20  THEN  data ELSE  null  END)   AS  udiagnosis_subject,
	      GROUP_CONCAT(CASE WHEN  field_id = 21  THEN  data ELSE  null  END)   AS  legal_person,
	      GROUP_CONCAT(CASE WHEN  field_id = 22  THEN  data ELSE  null  END)   AS  leading_official,
	      GROUP_CONCAT(CASE WHEN  field_id = 23  THEN  data ELSE  null  END)   AS  registration_mark,
	      GROUP_CONCAT(CASE WHEN  field_id = 24  THEN  data ELSE  null  END)   AS  period_of_validity,
	      GROUP_CONCAT(CASE WHEN  field_id = 25  THEN  data ELSE  null  END)   AS  pharmacyleader,
	      GROUP_CONCAT(CASE WHEN  field_id = 26  THEN  data ELSE  null  END)   AS  phone
	      FROM fds_unit_info_data where  
	      unit_id in(select unit_id from fds_unit_info_data where field_id=18 and data like '%".$keyword."%')
	      AND unit_id in(select id from fds_unit where unit_type_id =18)
	      GROUP BY unit_id desc LIMIT ".$nowperPage.",".$numPerPage." ");


        $this->assign('keyword',$keyword);
        $this->assign('datalist',$datalist);
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        return  $this->fetch('unit/listxzyy');
    }

    /**
     * 县镇医院信息编辑
     * @return mixed
     * @author yxf
     */
    public function editxzyy()
    {
        $unit_id = input('uid');
        $unitinfodata = new UnitInfoDataModel();
        //$infor = Db::query("SELECT unit_id,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 18 THEN   data ELSE  null  END)   AS  organization_name,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 19  THEN  data ELSE  null  END)   AS  addr,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 20  THEN  data ELSE  null  END)   AS  udiagnosis_subject,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 21  THEN  data ELSE  null  END)   AS  legal_person,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 22  THEN  data ELSE  null  END)   AS  leading_official,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 23  THEN  data ELSE  null  END)   AS  registration_mark,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 24  THEN  data ELSE  null  END)   AS  period_of_validity,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 25  THEN  data ELSE  null  END)   AS  pharmacyleader,
	    //  GROUP_CONCAT(CASE WHEN  field_id = 26  THEN  data ELSE  null  END)   AS  phone
	    //  FROM fds_unit_info_data where unit_id=".$unit_id." ");
        $info = $unitinfodata->field('unit_id,
          GROUP_CONCAT(CASE WHEN  field_id = 18  THEN  data ELSE  null  END)   AS  organization_name,
          GROUP_CONCAT(CASE WHEN  field_id = 19  THEN  data ELSE  null  END)   AS  addr,
	      GROUP_CONCAT(CASE WHEN  field_id = 20  THEN  data ELSE  null  END)   AS  udiagnosis_subject,
	      GROUP_CONCAT(CASE WHEN  field_id = 21  THEN  data ELSE  null  END)   AS  legal_person,
	      GROUP_CONCAT(CASE WHEN  field_id = 22  THEN  data ELSE  null  END)   AS  leading_official,
	      GROUP_CONCAT(CASE WHEN  field_id = 23  THEN  data ELSE  null  END)   AS  registration_mark,
	      GROUP_CONCAT(CASE WHEN  field_id = 24  THEN  data ELSE  null  END)   AS  period_of_validity,
	      GROUP_CONCAT(CASE WHEN  field_id = 25  THEN  data ELSE  null  END)   AS  pharmacyleader,
	      GROUP_CONCAT(CASE WHEN  field_id = 26  THEN  data ELSE  null  END)   AS  phone')
            ->where('unit_id','=',$unit_id)->find();

        $inform = $this->unit->where("id='{$unit_id}'")->find();
        //var_dump($inform);die;
        $unit_type = new UnitTypeModel();//获取单位类型
        $unit_type_info = $unit_type->select();
        $zone = db('zone')->where('parent_id',1)->select();//区域信息
        $this->assign('info',$info);
        $this->assign('inform',$inform);
        $this->assign('unit_type_info',$unit_type_info);
        $this->assign('zone',$zone);
        return  $this->fetch('unit/editxzyy');
    }

    /**
     * 县镇医院信息保存
     * @return mixed
     * @author yxf
     */
    public function saveInfoxzyy()
    {
        $data = input('post.');
        $validate = true;
        $unit_type_id = 18;
        $unitinfodata = new UnitInfoDataModel();
        $unitinfofield = new UnitInfoFieldModel();
        $datainform= ['name' => ''.input('post.name').'', 'addr' =>''.input('post.addr').'',
                        'phone'=>''.input('post.phone').'','unit_type_id'=>$unit_type_id,
                        'x_coord'=>''.input('post.x_coord').'','y_coord'=>''.input('post.y_coord').'',
                        'zone_id'=>''.input('post.zone_id').'',
                        'create_time'=>''.time().''];
                        //'create_time'=>''.strtotime(input('post.create_time')).''];

        if(true !== $validate)
        {
            $this->error($validate);
        }
        else
        {
            $unit_id = input('post.id');
            if($unit_id>0)//编辑
            {
                unset($datainform['create_time']);
                $result = $this->unit->where('id',$unit_id)->update($datainform);
                //$dataname = ['unit_id' => ''.input('post.id').'','field_id' => $unitinfofield->where('short_name','organization_name')
                    //->where('unit_type_id',$unit_type_id)->find('id'),'data'=>''.input('post.name').''];
                $dataname = ['unit_id' => ''.input('post.id').'','field_id' => 18,'data'=>''.input('post.name').''];
                $dataaddr = ['unit_id' => ''.input('post.id').'', 'field_id' => 19,'data'=>''.input('post.addr').''];
                $dataudiagnosissubject = ['unit_id' => ''.input('post.id').'', 'field_id' => 20,'data'=>''.input('post.udiagnosissubject').''];
                $datalegalperson = ['unit_id' => ''.input('post.id').'', 'field_id' => 21,'data'=>''.input('post.legalperson').''];
                $dataleadingofficial = ['unit_id' => ''.input('post.id').'', 'field_id' => 22,'data'=>''.input('post.leadingofficial').''];
                $dataregistrationmark = ['unit_id' => ''.input('post.id').'', 'field_id' => 23,'data'=>''.input('post.registrationmark').''];
                $datavalidityperiod = ['unit_id' => ''.input('post.id').'', 'field_id' => 24,'data'=>''.strtotime(input('post.validityperiod')).''];
                $datapharmacyleader = ['unit_id' => ''.input('post.id').'', 'field_id' => 25,'data'=>''.input('post.pharmacyleader').''];
                $dataphone = ['unit_id' => ''.input('post.id').'', 'field_id' => 26,'data'=>''.input('post.phone').''];

                $resname = $unitinfodata->where('unit_id',$unit_id)->where('field_id',18)->select();
                if(empty($resname)){
                    $resupname = $unitinfodata->insert($dataname);
                }else{
                    $resupname = $unitinfodata->where('unit_id',$unit_id)->where('field_id',18)->update($dataname);
                }
                $resaddr = $unitinfodata->where('unit_id',$unit_id)->where('field_id',19)->select();
                if(empty($resaddr)){
                    $resupaddr = $unitinfodata->insert($dataaddr);
                }else{

                    $resupname = $unitinfodata->where('unit_id',$unit_id)->where('field_id',19)->update($dataaddr);
                }
                $resudiagnosissubject = $unitinfodata->where('unit_id',$unit_id)->where('field_id',20)->select();
                if(empty($resudiagnosissubject)){
                    $resupudiagnosissubject = $unitinfodata->insert($dataudiagnosissubject);
                }else{
                    $resupudiagnosissubject = $unitinfodata->where('unit_id',$unit_id)->where('field_id',20)->update($dataudiagnosissubject);
                }
                $reslegalperson = $unitinfodata->where('unit_id',$unit_id)->where('field_id',21)->select();
                if(empty($reslegalperson)){
                    $resuplegalperson = $unitinfodata->insert($datalegalperson);
                }else{
                    $resuplegalperson = $unitinfodata->where('unit_id',$unit_id)->where('field_id',21)->update($datalegalperson);
                }
                $resleadingofficial = $unitinfodata->where('unit_id',$unit_id)->where('field_id',22)->select();
                if(empty($resleadingofficial)){
                    $resupleadingofficial = $unitinfodata->insert($dataleadingofficial);
                }else{
                    $resupleadingofficial = $unitinfodata->where('unit_id',$unit_id)->where('field_id',22)->update($dataleadingofficial);
                }
                $resregistrationmark = $unitinfodata->where('unit_id',$unit_id)->where('field_id',23)->select();
                if(empty($resregistrationmark)){
                    $resupregistrationmark = $unitinfodata->insert($dataregistrationmark);
                }else{
                    $resupregistrationmark = $unitinfodata->where('unit_id',$unit_id)->where('field_id',23)->update($dataregistrationmark);
                }
                $resvalidityperiod = $unitinfodata->where('unit_id',$unit_id)->where('field_id',24)->select();
                if(empty($resvalidityperiod)){
                    $resupvalidityperiod = $unitinfodata->insert($datavalidityperiod);
                }else{
                    $resupvalidityperiod = $unitinfodata->where('unit_id',$unit_id)->where('field_id',24)->update($datavalidityperiod);
                }
                $respharmacyleader = $unitinfodata->where('unit_id',$unit_id)->where('field_id',25)->select();
                if(empty($respharmacyleader)){
                    $resuppharmacyleader = $unitinfodata->insert($datapharmacyleader);
                }else{
                    $resuppharmacyleader = $unitinfodata->where('unit_id',$unit_id)->where('field_id',25)->update($datapharmacyleader);
                }
                $resphone = $unitinfodata->where('unit_id',$unit_id)->where('field_id',26)->select();
                if(empty($resphone)){
                    $resupphone = $unitinfodata->insert($dataphone);
                }else{
                    $resupphone = $unitinfodata->where('unit_id',$unit_id)->where('field_id',26)->update($dataphone);
                }
                if(false !== $result || false !== $resupaddr || false !== $resupname || false !== $resupudiagnosissubject
                    || false !== $resupleadingofficial || false !== $resuplegalperson || false !== $resupregistrationmark
                    || false !== $resupvalidityperiod || false !== $resuppharmacyleader || false !== $resupphone)
                {
                    success('保存成功','unit_listzxyy','closeCurrent');
                }
                else
                {
                    failure('保存失败！');
                }
            }
            else//新增
            {
                $datainform['create_time'] = time();
                $result = $this->unit->insert($datainform);
                $lastunit_id = Db::name('fds_unit')->getLastInsID();
                $datainfo=[
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 18,'data'=>''.input('post.name').''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 19,'data'=>''.input('post.addr').''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 20,'data'=>''.input('post.udiagnosissubject').''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 21,'data'=>''.input('post.legalperson').''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 22,'data'=>''.input('post.leadingofficial').''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 23,'data'=>''.input('post.registrationmark').''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 24,'data'=>''.strtotime(input('post.validityperiod')).''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 25,'data'=>''.input('post.pharmacyleader').''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 26,'data'=>''.input('post.phone').'']
                ];

                $ress = Db::name('unit_info_data')->insertAll($datainfo);
                if(false !== $result || false !== $ress)
                {
                    success('保存成功','unit_listxzyy','closeCurrent');
                }
                else
                {
                    failure('保存失败！');
                }
            }
        }
    }

    /**
     * 医院信息删除
     * @author yxf
     */
    public function removeInfoxzyy()
    {
        $unit_id = input('uid');
        $unitinfodata = new UnitInfoDataModel();
        $result = $this->unit->where('id',$unit_id)->delete();
        $res = $unitinfodata->where('unit_id',$unit_id)->delete();
        if(false !== $result || false !== $res)
        {
            success('删除成功','unit_listxzyy','');
        }
        else
        {
            failure('删除失败！');
        }
    }

    public function editlsyd()
    {
        return  $this->fetch('unit/editlsyd');
    }

    public function editgtzs()
    {
        return  $this->fetch('unit/editgtzs');
    }

    /**
     * 信息保存(废弃)
     * @author xdw
     */
    public function saveInfo()
    {
        $data = input('post.');
        //$validate = $this->validate($data,'Article.saveinfo');
        $validate = true;

        if(true !== $validate)
        {
            $this->error($validate);
        }
        else
        {
            $unit_id = input('post.id');
            if($unit_id>0)//编辑
            {
                $result = $this->unit->where('id',$unit_id)->update($data);
            }
            else//新增
            {
                $result = $this->unit->insert($data);
            }

            if(false !== $result)
            {
                success('保存成功','unit_list','closeCurrent');
            }
            else
            {
                failure('保存失败！');
            }
        }

    }

    /**
     * 信息删除(废弃)
     * @author xdw
     */
    public function removeInfo()
    {
        $unit_id = input('uid');
        $result = $this->unit->where('id',$unit_id)->delete();
        if(false !== $result)
        {
            success('删除成功','unit_list','');
        }
        else
        {
            failure('删除失败！');
        }
    }

    /**
     * 上传单位excel表
     * @return mixed
     * @date 20170323
     */
    public function unitUploadFile()
    {
        $unit_type_id = input('get.unit_type_id');
        $this->assign('unit_type_id',$unit_type_id);

        return $this->fetch('unit/unituploadfile');
    }

    /**
     * 获取上传的单位excel表,导入数据
     * @data 20170323
     */
    public function unitImport(){

        $unit_type_id = input('post.unit_type_id');

        if(isset($_FILES["unit_data_file"]))
        {
            if ($_FILES["unit_data_file"]["error"] > 0) {
                failure('上传文件失败！');
                die();
            } else {//判断文档上传类型
                $urlfilestr = strrchr($_FILES['unit_data_file']['name'], '.');//url后缀名
                $urlfilestr = strtolower($urlfilestr);
                $docmatch = array('.xls', '.xlsx');
                $filePath=$_FILES["unit_data_file"]["tmp_name"];
            }
        }

        error_reporting(0);
        import('PHPExcel/PHPExcel', EXTEND_PATH);
        $s = new \PHPExcel();

        /**默认用excel2007读取excel，若格式不对，则用之前的版本进行读取*/
        $PHPReader = new \PHPExcel_Reader_Excel2007();
        if(!$PHPReader->canRead($filePath)){
            $PHPReader = new \PHPExcel_Reader_Excel5();
            if(!$PHPReader->canRead($filePath)){
                echo 'no Excel';
                return ;
            }
        }

        $PHPExcel = $PHPReader->load($filePath);
        /**读取excel文件中的第一个工作表*/
        $currentSheet = $PHPExcel->getSheet(0);
        /**取得最大的列号*/
        $allColumn = $currentSheet->getHighestColumn();
        /**取得一共有多少行*/
        $allRow = $currentSheet->getHighestRow();

        $unitinfo = array(array());
        /**从第3行开始输出，因为excel表中前2行为列名*/
        for($currentRow = 3;$currentRow <= $allRow;$currentRow++)
        {
            /**从第A列开始输出*/
            $columnFlag = (strlen('A')<strlen($allColumn))||('A'<=$allColumn);//列比较
            for($currentColumn='A';$columnFlag; $currentColumn++)
            {
                $columnFlag = (strlen($currentColumn)<strlen($allColumn)) || ($currentColumn<$allColumn);
                $val = $currentSheet->getCellByColumnAndRow(ord($currentColumn) - 65,$currentRow)->getValue();/**ord()将字符转为十进制数*/
                $val = $currentSheet->getCellByColumnAndRow(ord($currentColumn) - 65,$currentRow)->getFormattedValue();/**ord()将字符转为十进制数*/
                $unitinfo[$currentRow-3][$currentColumn]=$val;
                //my_logger_2($currentColumn.'--'.$val);
                //$val = $currentSheet->getCellByColumnAndRow($currentColumn, $currentRow)->getValue();
                //$res[$currentRow-3][$currentColumn] = $val;
            }
        }

        //对读取的数据处理
        $unit_info_fields = db('unit_info_field')->where('unit_type_id',$unit_type_id)->order('sortorder')->select();//单位字段
        $unitinfodata = new UnitInfoDataModel();
        for ($i = 0; $i < $allRow - 2; $i++) {

            //将单位字段与excel表字段对应
            $field_index = 'A';
            $temp_data = array();
            foreach ($unit_info_fields as $field){
                $temp_data[$field['short_name']] = changeUnitInfoData_in($field['data_type'],$unitinfo[$i][$field_index]);
                $field_index++;
            }
           //my_logger($temp_data);

            //判断是否存在这样的 名称和单位类型
            $unit_name = $temp_data['name'];
            $sel_unit = $this->unit->where('name', $unit_name)->where('unit_type_id',$unit_type_id)->find();
            if ($sel_unit) {//存在，更新
               // my_logger('更新');
                $unit_id=$sel_unit['id'];
                $result = $this->unit->allowField(true)->save($temp_data,['id'=>$unit_id]);//更新单位坐标
                $update_info = array();
                foreach ($unit_info_fields as $field){
                    $unit_data = $unitinfodata->where('unit_id',$unit_id)->where('field_id',$field["id"])->find();//查询原有记录
                    if(empty($unit_data)){
                        $update_info[] = ['unit_id' => ''.$unit_id.'', 'field_id' => $field["id"],'data'=>''.$temp_data[$field['short_name']].''];
                    }else{
                        $update_info[] = ['id'=>$unit_data['id'],'unit_id' => ''.$unit_id.'', 'field_id' => $field["id"],'data'=>''.$temp_data[$field['short_name']].''];
                    }
                }
                $res_update = $unitinfodata->saveAll($update_info);//更新原有记录|新增记录
            }
            else //不存在，新增
            {
                //my_logger('新增');
                $temp_data['unit_type_id'] = $unit_type_id;
                $temp_data['create_time'] = time();
                $unit_model = new UnitModel();
                $result = $unit_model->allowField(true)->isUpdate(false)->save($temp_data);//新增到单位坐标记录
                $lastunit_id = Db::name('fds_unit')->getLastInsID();
                $datainfo = array();
                foreach($unit_info_fields as $field){
                    $datainfo[] = ['unit_id' => ''.$lastunit_id.'', 'field_id' => $field["id"],'data'=>''.$temp_data[$field['short_name']].''];
                }
                $ress = Db::name('unit_info_data')->insertAll($datainfo);//新增到单位基础信息
            }//end 新增
        }

        success('保存成功','unit_listxzyy','closeCurrent');
    }

    /**
     * 导出单位excel表
     */
    public function unitExport(){
        $unit_type_id = input('get.unit_type_id');

        error_reporting(0);
        import('PHPExcel/PHPExcel', EXTEND_PATH);
        $objPHPExcel = new \PHPExcel();
        $objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
            ->setLastModifiedBy("Maarten Balliauw")
            ->setTitle("Office 2007 XLSX Test Document")
            ->setSubject("Office 2007 XLSX Test Document")
            ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("Test result file");
        $objPHPExcel->getDefaultStyle()->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER)->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setWrapText(true);
        $objPHPExcel->getDefaultStyle()->getFont()->setSize(12);
        $objPHPExcel->getActiveSheet(0)->getDefaultColumnDimension()->setWidth(15);

        //单位类型信息
        $unit_type = db('unit_type')->where('id',$unit_type_id)->find();
        $unit_info_fields = db('unit_info_field')->where('unit_type_id',$unit_type_id)->order('sortorder')->select();
        //$objPHPExcel->getActiveSheet(0)->setTitle("恭城县医疗机构核准执业登记表（县、乡镇医院）")
        //    ->mergeCells('A1:I1')->setCellValue('A1', '恭城县医疗机构核准执业登记表（县、乡镇医院）');
        //设置表头信息
        $column_index = 'A';
        $column_end = 'A';//尾列
        foreach($unit_info_fields as $field){
            $objPHPExcel->getActiveSheet(0)->setCellValue($column_index.'2', $field['name']);//第二行，表头字段
            $column_end = $column_index;
            $column_index++;
        }
        $objPHPExcel->getActiveSheet(0)->setTitle()
            ->mergeCells('A1:'.$column_end.'1')->setCellValue('A1',''.$unit_type['name']);//首行，合并单元格，标题
        //获取各单位数据,查询语句拼接
        $field_sql = 'unit_id,';
        foreach ($unit_info_fields as $field){
            $field_sql .= 'GROUP_CONCAT(CASE WHEN field_id = '.$field['id'].' THEN data ELSE null END) AS '.$field['short_name'].',';
        }
        $field_sql = rtrim($field_sql,',');
        $sql = "SELECT ".$field_sql."
	      FROM fds_unit_info_data where  
	      unit_id in(select id from fds_unit where unit_type_id = ".$unit_type_id.")
	      GROUP BY unit_id";
        $dataList = Db::query($sql);

        $dataList = $dataList ? $dataList : array();
        $i=3;
        foreach ($dataList as $k => $data){//每个单位
            $column_index = 'A';
            foreach ($unit_info_fields as $field){//每个单位中各字段
                $temp_data = changeUnitInfoData_out($field['data_type'],$data[$field['short_name']]);
                $objPHPExcel->getActiveSheet(0)->setCellValue($column_index.$i, $temp_data);
                $column_index++;
            }
            $i++;
        }

        $fileName = $unit_type['name'].".xlsx";
        $writer = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $fileName . '"');
        header('Cache-Control: max-age=0');
        $writer->save('php://output');
    }


    /**
     * 上传单位excel表
     * @author yxf
     */
    public function uploadFile()
    {
        return $this->fetch('unit/uploadfile');
    }

    /**
     * 获取上传的单位excel表,导入数据
     * @author yxf
     */
    public function insertUnitxzyy()
    {
        if(isset($_FILES["fileurl"]))
        {
            if ($_FILES["fileurl"]["error"] > 0) {
                failure('上传文件失败！');
                die();
            } else {//判断文档上传类型

                $urlfilestr = strrchr($_FILES['fileurl']['name'], '.');//url后缀名
                $urlfilestr = strtolower($urlfilestr);

                $docmatch = array('.xls', '.xlsx');
                $filePath=$_FILES["fileurl"]["tmp_name"];
            }
        }

        error_reporting(0);
        import('PHPExcel/PHPExcel', EXTEND_PATH);
        $s = new \PHPExcel();
        $increase=array('A','B','C','D','E','F','G','H','I','J','K','L','M','N');

        /**默认用excel2007读取excel，若格式不对，则用之前的版本进行读取*/
        $PHPReader = new \PHPExcel_Reader_Excel2007();
        if(!$PHPReader->canRead($filePath)){
            $PHPReader = new \PHPExcel_Reader_Excel5();
            if(!$PHPReader->canRead($filePath)){
                echo 'no Excel';
                return ;
            }
        }

        $PHPExcel = $PHPReader->load($filePath);
        /**读取excel文件中的第一个工作表*/
        $currentSheet = $PHPExcel->getSheet(0);
        /**取得最大的列号*/
        $allColumn = $currentSheet->getHighestColumn();
        $unitinfo=array(array());
        /**取得一共有多少行*/
        $allRow = $currentSheet->getHighestRow();// echo "maxline=".$allRow;echo "<br>";
        /**从第3行开始输出，因为excel表中前2行为列名*/
        for($currentRow = 3;$currentRow <= $allRow;$currentRow++)
        //for($currentRow = 3;$currentRow <= 20;$currentRow++)
        {
            /**从第A列开始输出*/
            for($currentColumn=0;$currentColumn< count($increase); $currentColumn++)
            {
                $val = $currentSheet->getCellByColumnAndRow(ord($increase[$currentColumn]) - 65,$currentRow)->getValue();/**ord()将字符转为十进制数*/
                $unitinfo[$currentRow-3][$increase[$currentColumn]]=$val;
                //$val = $currentSheet->getCellByColumnAndRow($currentColumn, $currentRow)->getValue();
                //$res[$currentRow-2][$currentColumn] = $val;
            }
        }
        $unitinfodata =new UnitInfoDataModel();
        for ($i = 0; $i < $allRow - 2; $i++) {
            $unit_name = ''.$unitinfo[$i]['A'].'';
            $validityperiod = ''.$unitinfo[$i]['G'].'';
            list($year,$month,$day) = preg_split("'[\s-,./]+'", $validityperiod);
            $validityperiods = ''.$year.'-'.$month.'-'.$day.'';
            $sel_unit = $this->unit->where('name', $unit_name)->find();
            if ($sel_unit) {
                $unit_id=$sel_unit['id'];
                $data = ['addr' => ''.$unitinfo[$i]['B'].'', 'phone' => ''.$unitinfo[$i]['I'].''];
                $result = $this->unit->where('id', $unit_id)->update($data);
                $dataname = ['unit_id' => ''.$unit_id.'','field_id' => 18,'data'=>''.$unitinfo[$i]['A'].''];
                $dataaddr = ['unit_id' => ''.$unit_id.'', 'field_id' => 19,'data'=>''.$unitinfo[$i]['B'].''];
                $dataudiagnosissubject = ['unit_id' => ''.$unit_id.'', 'field_id' => 20,'data'=>''.$unitinfo[$i]['C'].''];
                $datalegalperson = ['unit_id' => ''.$unit_id.'', 'field_id' => 21,'data'=>''.$unitinfo[$i]['D'].''];
                $dataleadingofficial = ['unit_id' => ''.$unit_id.'', 'field_id' => 22,'data'=>''.$unitinfo[$i]['E'].''];
                $dataregistrationmark = ['unit_id' => ''.$unit_id.'', 'field_id' => 23,'data'=>''.$unitinfo[$i]['F'].''];
                $datavalidityperiod = ['unit_id' => ''.$unit_id.'', 'field_id' => 24,'data'=>strtotime($validityperiods)];
                $datapharmacyleader = ['unit_id' => ''.$unit_id.'', 'field_id' => 25,'data'=>''.$unitinfo[$i]['H'].''];
                $dataphone = ['unit_id' => ''.$unit_id.'', 'field_id' => 26,'data'=>''.$unitinfo[$i]['I'].''];

                $resname = $unitinfodata->where('unit_id',$unit_id)->where('field_id',18)->select();
                if(empty($resname)){
                    $resupname = $unitinfodata->insert($dataname);
                }else{
                    $resupname = $unitinfodata->where('unit_id',$unit_id)->where('field_id',18)->update($dataname);
                }
                $resaddr = $unitinfodata->where('unit_id',$unit_id)->where('field_id',19)->select();
                if(empty($resaddr)){
                    $resupaddr = $unitinfodata->insert($dataaddr);
                }else{

                    $resupname = $unitinfodata->where('unit_id',$unit_id)->where('field_id',19)->update($dataaddr);
                }
                $resudiagnosissubject = $unitinfodata->where('unit_id',$unit_id)->where('field_id',20)->select();
                if(empty($resudiagnosissubject)){
                    $resupudiagnosissubject = $unitinfodata->insert($dataudiagnosissubject);
                }else{
                    $resupudiagnosissubject = $unitinfodata->where('unit_id',$unit_id)->where('field_id',20)->update($dataudiagnosissubject);
                }
                $reslegalperson = $unitinfodata->where('unit_id',$unit_id)->where('field_id',21)->select();
                if(empty($reslegalperson)){
                    $resuplegalperson = $unitinfodata->insert($datalegalperson);
                }else{
                    $resuplegalperson = $unitinfodata->where('unit_id',$unit_id)->where('field_id',21)->update($datalegalperson);
                }
                $resleadingofficial = $unitinfodata->where('unit_id',$unit_id)->where('field_id',22)->select();
                if(empty($resleadingofficial)){
                    $resupleadingofficial = $unitinfodata->insert($dataleadingofficial);
                }else{
                    $resupleadingofficial = $unitinfodata->where('unit_id',$unit_id)->where('field_id',22)->update($dataleadingofficial);
                }
                $resregistrationmark = $unitinfodata->where('unit_id',$unit_id)->where('field_id',23)->select();
                if(empty($resregistrationmark)){
                    $resupregistrationmark = $unitinfodata->insert($dataregistrationmark);
                }else{
                    $resupregistrationmark = $unitinfodata->where('unit_id',$unit_id)->where('field_id',23)->update($dataregistrationmark);
                }
                $resvalidityperiod = $unitinfodata->where('unit_id',$unit_id)->where('field_id',24)->select();
                if(empty($resvalidityperiod)){
                    $resupvalidityperiod = $unitinfodata->insert($datavalidityperiod);
                }else{
                    $resupvalidityperiod = $unitinfodata->where('unit_id',$unit_id)->where('field_id',24)->update($datavalidityperiod);
                }
                $respharmacyleader = $unitinfodata->where('unit_id',$unit_id)->where('field_id',25)->select();
                if(empty($respharmacyleader)){
                    $resuppharmacyleader = $unitinfodata->insert($datapharmacyleader);
                }else{
                    $resuppharmacyleader = $unitinfodata->where('unit_id',$unit_id)->where('field_id',25)->update($datapharmacyleader);
                }
                $resphone = $unitinfodata->where('unit_id',$unit_id)->where('field_id',26)->select();
                if(empty($resphone)){
                    $resupphone = $unitinfodata->insert($dataphone);
                }else{
                    $resupphone = $unitinfodata->where('unit_id',$unit_id)->where('field_id',26)->update($dataphone);
                }
                unset($dataphone);
                unset($data);
                unset($result);
                unset($dataname);
                unset($dataaddr);
                unset($dataudiagnosissubject);
                unset($datalegalperson);
                unset($dataleadingofficial);
                unset($dataregistrationmark);
                unset($datavalidityperiod);
                unset($datapharmacyleader);
            } else {
                $data = ['name' => $unit_name, 'addr' => ''.$unitinfo[$i]['B'].'',
                    'unit_type_id' => 18,'create_time' => time()];
                $result = $this->unit->insert($data);
                $lastunit_id = Db::name('fds_unit')->getLastInsID();
                $datainfo=[
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 18,'data'=>''.$unitinfo[$i]['A'].''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 19,'data'=>''.$unitinfo[$i]['B'].''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 20,'data'=>''.$unitinfo[$i]['C'].''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 21,'data'=>''.$unitinfo[$i]['D'].''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 22,'data'=>''.$unitinfo[$i]['E'].''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 23,'data'=>''.$unitinfo[$i]['F'].''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 24,'data'=>strtotime($validityperiods)],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 25,'data'=>''.$unitinfo[$i]['H'].''],
                    ['unit_id' => ''.$lastunit_id.'', 'field_id' => 26,'data'=>''.$unitinfo[$i]['I'].'']
                ];
                $ress = Db::name('unit_info_data')->insertAll($datainfo);
                unset($data);
                unset($datainfo);
                unset($lastunit_id);
            }
        }
        success('保存成功','unit_listxzyy','closeCurrent');
    }


    /**
     * 导出县镇医院excel表
     * @author yxf
     */
    public function downloadUnitxzyy()
    {
        error_reporting(0);
        import('PHPExcel/PHPExcel', EXTEND_PATH);
        $objPHPExcel = new \PHPExcel();
        $objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
            ->setLastModifiedBy("Maarten Balliauw")
            ->setTitle("Office 2007 XLSX Test Document")
            ->setSubject("Office 2007 XLSX Test Document")
            ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("Test result file");
        $objPHPExcel->getDefaultStyle()->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER)->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $objPHPExcel->getDefaultStyle()->getAlignment()->setWrapText(true);
        $objPHPExcel->getDefaultStyle()->getFont()->setSize(12);
        $objPHPExcel->getActiveSheet(0)->getDefaultColumnDimension()->setWidth(11);
        $objPHPExcel->getActiveSheet(0)->getColumnDimension('C')->setWidth(20);
        $objPHPExcel->getActiveSheet(0)->getColumnDimension('F')->setWidth(15);
        $objPHPExcel->getActiveSheet(0)->getColumnDimension('I')->setWidth(13);
        $objPHPExcel->getActiveSheet(0)->getRowDimension('1')->setRowHeight(30);
        $objPHPExcel->getActiveSheet(0)->setTitle("恭城县医疗机构核准执业登记表（县、乡镇医院）")
            ->mergeCells('A1:I1')->setCellValue('A1', '恭城县医疗机构核准执业登记表（县、乡镇医院）');
        $objPHPExcel->getActiveSheet(0)->setCellValue('A2', "机构名称");
        $objPHPExcel->getActiveSheet(0)->setCellValue('B2', "地址");
        $objPHPExcel->getActiveSheet(0)->setCellValue('C2', "诊疗科目");
        $objPHPExcel->getActiveSheet(0)->setCellValue('D2', "法定代表人");
        $objPHPExcel->getActiveSheet(0)->setCellValue('E2', "主要负责人");
        $objPHPExcel->getActiveSheet(0)->setCellValue('F2', "医疗机构登记号");
        $objPHPExcel->getActiveSheet(0)->setCellValue('G2', "证书有效期");
        $objPHPExcel->getActiveSheet(0)->setCellValue('H2', "药房负责人");
        $objPHPExcel->getActiveSheet(0)->setCellValue('I2', "联系电话");
        $res = Db::query("SELECT unit_id, 
	      GROUP_CONCAT(CASE WHEN  field_id = 18  THEN  data ELSE  null  END)   AS  organization_name,
	      GROUP_CONCAT(CASE WHEN  field_id = 19  THEN  data ELSE  null  END)   AS  addr,
	      GROUP_CONCAT(CASE WHEN  field_id = 20  THEN  data ELSE  null  END)   AS  udiagnosis_subject,
	      GROUP_CONCAT(CASE WHEN  field_id = 21  THEN  data ELSE  null  END)   AS  legal_person,
	      GROUP_CONCAT(CASE WHEN  field_id = 22  THEN  data ELSE  null  END)   AS  leading_official,
	      GROUP_CONCAT(CASE WHEN  field_id = 23  THEN  data ELSE  null  END)   AS  registration_mark,
	      GROUP_CONCAT(CASE WHEN  field_id = 24  THEN  data ELSE  null  END)   AS  period_of_validity,
	      GROUP_CONCAT(CASE WHEN  field_id = 25  THEN  data ELSE  null  END)   AS  pharmacyleader,
	      GROUP_CONCAT(CASE WHEN  field_id = 26  THEN  data ELSE  null  END)   AS  phone
	      FROM fds_unit_info_data where  
	      unit_id in(select unit_id from fds_unit_info_data where field_id=18)
	      AND unit_id in(select id from fds_unit where unit_type_id =18)
	      GROUP BY unit_id");
        $res = $res ? $res : array();
        $i=3;
        foreach ($res as $k => $ress){
            $objPHPExcel->getActiveSheet(0)->setCellValue('A' . $i, $ress['organization_name']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('B' . $i, $ress['addr']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('C' . $i, $ress['udiagnosis_subject']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('D' . $i, $ress['legal_person']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('E' . $i, $ress['leading_official']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('F' . $i, $ress['registration_mark']);
            if(empty($ress['period_of_validity'])){
                $objPHPExcel->getActiveSheet(0)->setCellValue('G' . $i, " ");
            }else{
                $objPHPExcel->getActiveSheet(0)->setCellValue('G' . $i, date('Y-m-d',$ress['period_of_validity']));
            }
            $objPHPExcel->getActiveSheet(0)->setCellValue('H' . $i, $ress['pharmacyleader']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('I' . $i, $ress['phone']);
            $i++;
        }

        $fileName = "恭城县医疗机构核准执业登记表（县、乡镇医院）.xlsx";
        $writer = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $fileName . '"');
        header('Cache-Control: max-age=0');
        $writer->save('php://output');

    }

    /**
     * 单位地图
     * @author xdw
     * @20161128
     */
    public function unitMap()
    {
        $x_point = input('get.x_point');
        $y_point = input('get.y_point');
        $my_map = new MyMapModel();
        $map_zones = $my_map->getAreas();
        $this->assign('map_zones',$map_zones);
        $this->assign('x_point',$x_point);
        $this->assign('y_point',$y_point);
        return $this->fetch('unit/unitmap');
    }

}
