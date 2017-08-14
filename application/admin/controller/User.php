<?php
/**
 * 用户控制器
 *
 * @author  xdw
 * @date  20161119
 */
namespace app\admin\controller;
use app\admin\model\UnitType as UnitTypeModel;
use app\admin\model\AdminDepartment as AdminDepartmentModel;

/**
 * 用户控制器
 *
 * @author  xdw
 * @date  20161119
 */
class User extends Common
{
    public function _initialize()
    {
        parent::_initialize();
        $this->user = db('AppUser');
    }

    /**
     * 用户列表
     *
     * @author  xdw
     * @date  20161119
     */
    public function index()
    {
        $keyword = input('?post.keyword')?input('post.keyword'):'';//搜索关键字
        $numPerPage =  input('?post.numPerPage')?input('post.numPerPage'):'20';//每页条数
        $currentPage =  input('?post.pageNum')?input('post.pageNum'):1;//当前页

        $department_ids = get_admin_manage_department();//获取管理的部门id

        $map['account|nickname']  = ['like','%'.$keyword.'%'];
        $map['department_id']  = ['in',$department_ids];
        $data_count = $this->user->where($map)->select();
        $data_list = $this->user->where($map)->alias('u')
            ->field('u.*,ut.name department')
            ->join('fds_admin_department ut','ut.id=u.department_id','LEFT')
            ->page("$currentPage,$numPerPage")->order('id desc')->select();//分页记录集
        $totalCount = count($data_count);//总记录数
        $this->assign('totalCount',$totalCount);
        $this->assign('numPerPage',$numPerPage);
        $this->assign('currentPage',$currentPage);
        $this->assign('datalist',$data_list);
        $this->assign('keyword',$keyword);
        return $this->fetch('user/index');
    }

    /**
     * 新增/编辑 页面
     * @return mixed
     * @author xdw
     */
    public function edit()
    {
        $user_id = input('uid');
        $info = $this->user->where("id='{$user_id}'")->find();
        $admin_department = new AdminDepartmentModel();
        $department = $admin_department->select();
        $this->assign('department',$department);
        $this->assign('info',$info);
        return  $this->fetch('user/edit');
    }

    /**
     * 信息保存
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
            $user_id = input('post.id');
            if($user_id>0)//编辑
            {
                //如果帐号被修改，但与现有帐号不重复，拒绝更新
                if($data['account']!=$data['old_account'] && ($this->user->where('account',$data['account'])->select()))
                {
                    failure('账号已存在！');
                    exit;
                }
                $data['update_time'] = time();
                if($data['old_pw'] != $data['password'])//新旧密码对比
                {
                    $data['password'] = md5($data['password']);
                }
                unset($data['old_pw']);
                unset($data['old_account']);
                $result = $this->user->where('id',$user_id)->update($data);
            }
            else//新增
            {
                if($this->user->where('account',$data['account'])->select())
                {
                    failure('账号已存在！');
                    exit;
                }
                $data['create_time'] = time();
                $data['password'] = md5($data['password']);
                unset($data['old_pw']);
                unset($data['old_account']);
                $result = $this->user->insert($data);
            }

            if(false !== $result)
            {
                success('保存成功','user_list','closeCurrent');
            }
            else
            {
                failure('保存失败');
            }
        }
    }

    /**
     * 信息删除
     * @author xdw
     */
    public function removeInfo()
    {
        $user_id = input('uid');
        $result = $this->user->where('id',$user_id)->delete();
        if(false !== $result)
        {
            success('删除成功','user_list','');
        }
        else
        {
            failure('删除失败！');
        }
    }

    /**
     * 上传用户excel表
     * @author yxf
     */
    public function uploadFile()
    {
        return $this->fetch('user/uploadfile');
    }

    /**
     * 获取上传的用户excel表,导入数据
     * @author yxf
     */
    public function insertUser()
    {
        if(isset($_FILES["fileurl"]))
        {
            if ($_FILES["fileurl"]["error"] > 0) {
                failure('上传文档失败！');
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
        $unittype = new UnitTypeModel();
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
        $userinfo=array(array());
        /**取得一共有多少行*/
        $allRow = $currentSheet->getHighestRow();// echo "maxline=".$allRow;echo "<br>";
        /**从第3行开始输出，因为excel表中前2行为列名*/
        for($currentRow = 3;$currentRow <= $allRow;$currentRow++)
        {
            /**从第A列开始输出*/

            for($currentColumn=0;$currentColumn< count($increase); $currentColumn++)
            {
                $val = $currentSheet->getCellByColumnAndRow(ord($increase[$currentColumn]) - 65,$currentRow)->getValue();/**ord()将字符转为十进制数*/
                $userinfo[$currentRow-3][$increase[$currentColumn]]=$val;
            }
        }

        for ($i = 0; $i < $allRow - 2; $i++) {
            $user_account = ''.$userinfo[$i]['A'].'';
            $sel_user = $this->user->where('account', $user_account)->select();
            $departmentid = $unittype->where('name',''.$userinfo[$i]['E'].'')->find('id');
            if ($sel_user) {
                $data = ['update_time' => time(), 'nickname' => ''.$userinfo[$i]['B'].'', 'password' => md5($userinfo[$i]['C']),
                    'email' => ''.$userinfo[$i]['D'].'','department_id' => $departmentid];
                $result = $this->user->where('id', $sel_user['0']['id'])->update($data);
            } else {
                $data = ['account' => $user_account, 'create_time' => time(), 'nickname' => ''.$userinfo[$i]['B'].'', 'password' => md5($userinfo[$i]['C']),
                    'email' => ''.$userinfo[$i]['D'].'','department_id' => $departmentid];
                $result = $this->user->insert($data);
            }
        }
        success('保存成功','user_list','closeCurrent');
    }


    /**
     * 导出用户excel表
     * @author yxf
     */
    public function downloadUser()
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
        $objPHPExcel->getActiveSheet(0)->getDefaultColumnDimension()->setWidth(12);
        $objPHPExcel->getActiveSheet(0)->getColumnDimension('C')->setWidth(20);
        $objPHPExcel->getActiveSheet(0)->getColumnDimension('D')->setWidth(15);
        $objPHPExcel->getActiveSheet(0)->setTitle("执法人员名单")
            ->mergeCells('A1:D1')->setCellValue('A1', '执法人员名单');
        $objPHPExcel->getActiveSheet(0)->setCellValue('A2', "帐号");
        $objPHPExcel->getActiveSheet(0)->setCellValue('B2', "名字");
        $objPHPExcel->getActiveSheet(0)->setCellValue('C2', "邮箱");
        $objPHPExcel->getActiveSheet(0)->setCellValue('D2', "所属部门");
        $res = $this->user->alias('u')
            ->field('u.*,ut.name department')
            ->join('fds_admin_department ut','ut.id=u.department_id','LEFT')
            ->order('u.id', 'desc')
            ->select();
        $res = $res ? $res : array();
        $i=3;
        foreach ($res as $k => $ress){
            $objPHPExcel->getActiveSheet(0)->setCellValue('A' . $i, $ress['account']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('B' . $i, $ress['nickname']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('C' . $i, $ress['email']);
            $objPHPExcel->getActiveSheet(0)->setCellValue('D' . $i, $ress['department']);
            $i++;
        }

        $fileName = "APP用户表.xlsx";
        $writer = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="' . $fileName . '"');
        header('Cache-Control: max-age=0');
        $writer->save('php://output');

    }
}
