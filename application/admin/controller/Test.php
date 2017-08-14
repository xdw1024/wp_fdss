<?php
/**
 * 用户控制器
 *
 * @author  xdw
 * @date  20161119
 */
namespace app\admin\controller;

use app\admin\model\AdministrativeArea;
use think\Db;
/**
 * 用户控制器
 *
 * @author  xdw
 * @date  20161119
 */
class Test extends Common
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
        $data_list = $this->user->select();
        $this->assign('datalist',$data_list);
        return $this->fetch();
    }

    public function test1()
    {
        $data_list = $this->user->select();
        $this->assign('datalist',$data_list);
//        return $this->fetch('test/index');
        return $this->fetch('test/uploadfile');
    }

    public function test2()
    {
        $data_list = $this->user->select();
        $this->assign('datalist',$data_list);
        return $this->fetch('test/test2');
    }

    /**
     * 上传行政区域 excel 表格
     */
    public function uploadAdministrative(){
        return $this->fetch('test/uploadfile');
    }

    /**
     * 获取上传的行政区域 excel表,导入数据
     */
    public function insertAdministrative()
    {
        $administrative_area = new AdministrativeArea();
        if(isset($_FILES["fileurl"]))
        {
            if ($_FILES["fileurl"]["error"] > 0) {
                //failure('上传文档失败');
                print_r("false");
                failure('上传文件失败！');
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
        /**从第3行开始输出，因为excel表中前7行为列名*/
        for($currentRow = 3;$currentRow <= $allRow;$currentRow++)
        {
            /**从第A列开始输出*/
            for($currentColumn=0;$currentColumn< count($increase); $currentColumn++)
            {
                $val = $currentSheet->getCellByColumnAndRow(ord($increase[$currentColumn]) - 65,$currentRow)->getValue();/**ord()将字符转为十进制数*/
                $unitinfo[$currentRow-3][$increase[$currentColumn]]=$val;
            }
        }

        for ($i = 0; $i < $allRow - 2; $i++) {
            $zone_code = $unitinfo[$i]['A'];
            $sel_recode = $administrative_area->where('zone_code', $zone_code)->select();
            if ($sel_recode) {
                $data = ['zone_name' => $unitinfo[$i]['B']];
                $result = $administrative_area->where('id', $sel_recode['0']['id'])->update($data);
            } else {
                $data = ['zone_code' => $zone_code, 'zone_name' => $unitinfo[$i]['B']];
                $result = $administrative_area->insert($data);
            }
        }
        success('保存成功','user_list','closeCurrent');

    }




}
