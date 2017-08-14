<?php
/**
 * 定时执行文件
 * 流程如下：
 * 通过 linux 的crontab ，编写脚本定时访问相应方法的URL，实现定时执行
 * 如: => * * * * * curl http://xxx/fdss/public/index.php/admin/cron/xxx方法 <=
 * Created by PhpStorm.
 * User: xdw
 * Date: 16-12-13
 * Time: 上午10:48
 */
namespace app\admin\controller;

use app\admin\model\Task;
use app\admin\model\TaskUnitLink;
use app\admin\model\CheckRecord;
use app\admin\model\TaskUserLink;
use think\Controller;
use think\Db;

/**
 * 定时执行文件
 *
 * User: xdw
 * Date: 16-12-13
 * Time: 上午10:48
 */
class Cron extends Controller
{

    /**
     * 自动修正系统预警时间间隔
     *
     * 注意：如果初始设置值在2个区间范围 前？
     */
    public function autoChangeWarningTime()
    {
        $warning_conditions = db('warning_advance')->where('id','in','1,2,3')->select();
        foreach($warning_conditions as $warning_condition){
            switch($warning_condition['id'])
            {
                case 1: //年预警
                    if($warning_condition['end_time'] < time() ){
                        $start_year = date('Y',$warning_condition['end_time']);
                        $end_year = $start_year + $warning_condition['num_interval'];
                        $new_time['start_time'] = $warning_condition['end_time'];
                        $new_time['end_time'] = mktime(0,0,0,1,1,$end_year);

                        $warning = db('WarningAdvance');
                        $result = $warning->where('id',$warning_condition['id'])->update($new_time);
                    }
                    break;
                case 2: //月预警
                    if($warning_condition['end_time'] < time() ){
                        list($start_date['y'],$start_date['m']) = explode("-",date('Y-m',$warning_condition['end_time']));
                        $end_month = $start_date['m'] + $warning_condition['num_interval'];
                        $new_time['start_time'] = $warning_condition['end_time'];
                        $new_time['end_time'] = mktime(0,0,0,$end_month,1,$start_date['y']);

                        $warning = db('WarningAdvance');
                        $result = $warning->where('id',$warning_condition['id'])->update($new_time);
                    }
                    break;
                case 3: //天预警
                    if($warning_condition['end_time'] < time() ){
                        list($start_date['y'],$start_date['m'],$start_date['d']) = explode("-",date('Y-m-d',$warning_condition['end_time']));
                        $end_day = $start_date['d'] + $warning_condition['num_interval'];
                        $new_time['start_time'] = $warning_condition['end_time'];
                        $new_time['end_time'] =  mktime(0,0,0,$start_date['m'],$end_day,$start_date['y']);
                        $warning = db('WarningAdvance');
                        $result = $warning->where('id',$warning_condition['id'])->update($new_time);
                    }
                    break;
                default:
                    $time = array();
            }
        }

        //$warning_conditions = db('warning_advance')->where('id','in','1,2,3')->select();
        //var_dump($warning_conditions);

    }

    /**
     * 自动检测达到预警阀值的单位
     */
    public function autoAnalyseCheckWarningUnit()
    {
        $this->autoDeleteWarningUnitRecord();//清空所有预警记录
        $advance_percent = 0.8;
        $warning_conditions = db('warning_advance')->select();
        //遍历各预警条件
        foreach($warning_conditions as $warning_condition)
        {
            //获取预警条件时间段，要在截止时间前预警(此处提前20%）
            $time_slot = ($this->calculateWarningLimitTime_2($warning_condition)) * $advance_percent;
            //计算已用时间
            $used_time = time() - $warning_condition['start_time'];
            //如果已用时间没有达到预警阀值，不进行预警计算，进去下个预警条件的分析
            if($used_time <= $time_slot){
                continue;
            }
            else //达到预警时间
            {
                //获取在给定时间段中没有检查记录的单位
                $un_check_units = Db::query("SELECT u.id FROM fds_unit u
                        WHERE u.id NOT IN
                        (
                            SELECT cr.unit_id
                            FROM fds_check_record cr
                            WHERE cr.time BETWEEN ? AND ?
                        )", [$warning_condition['start_time'], $warning_condition['end_time']]);
                var_dump($un_check_units);

                //将未检查的单位保存到预警表
                if ($un_check_units) {
                    $list = array();
                    foreach ($un_check_units as $item) {
                        $temp['unit_id'] = $item['id'];
                        $temp['warning_id'] = $warning_condition['id'];
                        $temp['time'] = time();
                        $list[] = $temp;
                    }
                    $result = db('warning_unit')->insertAll($list);
                }
            }//end 达到预警时间

        }
    }
    /** end 自动检测达到预警阀值的单位 */

    /**
     * 删除单位预警表中的所有记录
     */
    private function autoDeleteWarningUnitRecord()
    {
        $result = db('warning_unit')->where(1)->delete();
    }

    /**
     * 保存预警单位
     * @param $unitId
     * @param $warningId
     */
    private function saveWarningUnit($unitId,$warningId)
    {
        $data = ['unit_id' => $unitId, 'warning_id' => $warningId,'time'=>time()];
        $result = db('warningUnit')->insert($data);
    }

    /**
     * 计算预警间隔时间
     * @param $warning_condition
     * @return mixed
     */
    private function calculateWarningLimitTime_2($warning_condition)
    {
        $time_slot = $warning_condition['end_time'] - $warning_condition['start_time'];
        $time_use = time() - $warning_condition['start_time'];
        var_dump($warning_condition['name'].'-----当前日：'.date('Y-m-d',time()).'-----起始日：'.date('Y-m-d',$warning_condition['start_time']).'-----截止日：'.date('Y-m-d',$warning_condition['end_time']).'**********'.($time_use/86400).'**********'.$time_slot/86400);
        return $time_slot;
    }
    /** end 自动检测达到预警阀值的单位 */

    /**
     * 计算预警间隔时间
     * @param $warning_condition
     * @return mixed
     */
    private function calculateWarningLimitTime_1($warning_condition)
    {
        if($warning_condition['type']==1)//系统预警
        {
            switch($warning_condition['id'])
            {
                case 1:
                    $now_year = date('Y');
                    $init_year = date('Y',$warning_condition['start_time']);
                    //本周期已用时间 = （当前时间 - 第一个周期开始的时间）% 周期
                    $used_time = ($now_year - $init_year) % $warning_condition['num_interval'];
                    $start_year = $now_year - $used_time;
                    $end_year = $now_year + ($warning_condition['num_interval'] - $used_time);
                    $start_time = strtotime($start_year.'-01-01');
                    $end_time = strtotime($end_year.'-01-01');
                    //$condition_time['start_time'] = $start_time;
                    //$condition_time['time_slot'] = $end_time - $start_time;
                    $time_slot = $end_time - $start_time;
                    var_dump('-----当前年：'.date('Y-m-d',time()).'-----起始年：'.date('Y-m-d',$start_time).'-----截止年：'.date('Y-m-d',$end_time).'-----间隔年：'.$warning_condition['num_interval'].'********************');
                    break;
                case 2:
                    list($now_date['y'],$now_date['m']) = explode("-",date('Y-m',time()));
                    list($init_date['y'],$init_date['m']) = explode("-",date('Y-m',$warning_condition['num_interval']));
                    $used_time = (($init_date['y']-$now_date['y'])*12 +$init_date['m']-$now_date['m']) % $warning_condition['num_interval'];
                    $start_month = $now_date['m'] - $used_time;
                    $end_month = $now_date['m'] + ($warning_condition['num_interval'] - $used_time);
                    $start_time = mktime(0,0,0,$start_month,1,$now_date['y']);
                    $end_time = mktime(0,0,0,$end_month,1,$now_date['y']);
                    //$condition_time['start_time'] = $start_time;
                    //$condition_time['time_slot'] = $end_time - $start_time;
                    $time_slot = $end_time - $start_time;
                    var_dump('-----当前月：'.date('Y-m-d',time()).'-----起始月：'.date('Y-m-d',$start_time).'-----截止月：'.date('Y-m-d',$end_time).'-----间隔月：'.$warning_condition['num_interval'].'********************');
                    break;
                case 3:
                    list($now_date['y'],$now_date['m'],$now_date['d']) = explode("-",date('Y-m-d',time()));
                    list($init_date['y'],$init_date['m'],$init_date['d']) = explode("-",date('Y-m-d',$warning_condition['num_interval']));
                    $used_time = round((time() - $warning_condition['num_interval']) / 3600 / 24) % $warning_condition['num_interval'];
                    $start_day = date('d') - $used_time;
                    $end_day = date('d') + ($warning_condition['num_interval'] - $used_time);
                    $start_time = mktime(0,0,0,$now_date['m'],$start_day,$now_date['y']);
                    $end_time = mktime(0,0,0,$now_date['m'],$end_day,$now_date['y']);
                    //$condition_time['start_time'] = $start_time;
                    //$condition_time['time_slot'] = $end_time - $start_time;
                    $time_slot = $end_time - $start_time;
                    var_dump('-----当前日：'.date('Y-m-d',time()).'-----起始日：'.date('Y-m-d',$start_time).'-----截止日：'.date('Y-m-d',$end_time).'-----间隔日：'.$warning_condition['num_interval'].'********************');
                    break;
                default:
                    $time_slot = 0;
            }
        }
        else//任务预警
        {
            $time_slot = $warning_condition['end_time'] - $warning_condition['start_time'];
            //$condition_time['start_time'] = $warning_condition['start_time'];
            //$condition_time['time_slot'] = $time_slot;
            var_dump($warning_condition['name'].'-----当前日：'.date('Y-m-d',time()).'-----起始日：'.date('Y-m-d',$warning_condition['start_time']).'-----截止日：'.date('Y-m-d',$warning_condition['end_time']).'********************');
        }
        return $time_slot;
    }
    /** end 自动检测达到预警阀值的单位 */


    /**
     * 自动分析检查任务的完成状态
     */
    public function autoAnalyseTaskStatus()
    {
        $task_model = new Task();
        $all_tasks = $task_model->select();
        //对各任务分析
        foreach ($all_tasks as $task)
        {
            //获取任务相关单位
            $task_unit_model = new TaskUnitLink();
            $task_units = $task_unit_model->where('task_id',$task->id)
                                         ->column('unit_id');
            if($task_units)
            {
                //统计已检查的单位数
                $check_record_model = new CheckRecord();
                $completed_tasks = $check_record_model->where('unit_id', 'in', implode(',',$task_units))
                    ->where('time', 'between', [$task->start_time, $task->end_time])
                    ->select();
                //计算任务的完成进度百分比
                //$progress = round(count($completed_tasks)/count($task_units),3)*100;
                $progress = (count($completed_tasks)==count($task_units))? 1 : 0;
            }
            else{
                $progress = 0;
            }

            //更新任务完成进度状态
            if($progress)
            {
                $task_user_model = new TaskUserLink();
                $task_user_model->save([
                    'complete'  => 1,
                    'time' => time()
                ],['task_id' => $task->id]);
            }
            else
            {
                $task_user_model = new TaskUserLink();
                $task_user_model->save([
                    'complete'  => 0,
                    'time' => ''
                ],['task_id' => $task->id]);
            }

        }

    }
    /** end  自动分析检查任务的完成状态 */

}
