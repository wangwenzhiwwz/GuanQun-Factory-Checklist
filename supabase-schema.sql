-- 冠群工厂宣传片协作清单数据库
create table if not exists public.checklist_tasks (
 id text primary key, section text not null, title text not null,
 description text not null default '', completed boolean not null default false,
 updated_at timestamptz not null default now(), updated_by uuid references auth.users(id)
);
alter table public.checklist_tasks enable row level security;
drop policy if exists "team can read checklist" on public.checklist_tasks;
create policy "team can read checklist" on public.checklist_tasks for select to authenticated using (true);
drop policy if exists "team can update checklist" on public.checklist_tasks;
create policy "team can update checklist" on public.checklist_tasks for update to authenticated using (true) with check (true);
insert into public.checklist_tasks(id,section,title,description) values
('01-01','01 / 工厂实景与生产流程','工厂航拍','工厂整体外观、厂区环境'),
('01-02','01 / 工厂实景与生产流程','前台','前台及企业形象'),
('01-03','01 / 工厂实景与生产流程','5楼物料','物料区域及物料管理'),
('01-04','01 / 工厂实景与生产流程','仓库','仓库整体环境'),
('01-05','01 / 工厂实景与生产流程','生产线全流程','完整呈现生产各环节'),
('01-06','01 / 工厂实景与生产流程','自动化机器','重点拍摄自动化设备运行'),
('01-07','01 / 工厂实景与生产流程','多生产线','不同生产线的整体及细节'),
('01-08','01 / 工厂实景与生产流程','MES系统','MES系统实际运行画面'),
('02-01','02 / 实验室','实验室全景','展示实验室整体环境'),
('02-02','02 / 实验室','防摔测试','产品防摔测试过程'),
('02-03','02 / 实验室','防尘测试','产品防尘测试过程'),
('02-04','02 / 实验室','防水测试','产品防水测试过程'),
('02-05','02 / 实验室','插拔测试','产品接口插拔测试过程'),
('03-01','03 / 包装打包','屏幕保护膜','机器贴屏幕保护膜过程'),
('03-02','03 / 包装打包','整机成品包装','产品完整包装过程'),
('03-03','03 / 包装打包','过热缩膜','重点强调过热缩膜工序'),
('03-04','03 / 包装打包','机器与物料','尽量多拍机器和物料，少拍人'),
('04-01','04 / 品牌及生产线素材准备','Ulefone产品线','准备生产线实拍素材'),
('04-02','04 / 品牌及生产线素材准备','RugOne生产线','准备生产线实拍素材'),
('04-03','04 / 品牌及生产线素材准备','行业设备生产线','准备无Logo的客户行业机器产线画面'),
('04-04','04 / 品牌及生产线素材准备','行业设备辅助素材','商务办公主机、无品牌产品示例图等素材'),
('04-05','04 / 品牌及生产线素材准备','行业订单能力展示','体现可承接手机、平板及行业设备订单的能力'),
('05-01','05 / MES系统演示准备','MES平板操作','拍摄工作人员使用平板操作MES系统'),
('05-02','05 / MES系统演示准备','设备联动画面','展示MES系统与其他机器联通'),
('05-03','05 / MES系统演示准备','扫码录入','拍摄扫码录入MES系统的过程'),
('05-04','05 / MES系统演示准备','现场实拍','提前协调人员、设备及操作流程'),
('06-01','06 / 拍摄现场注意事项','环境清洁','画面保持干净无尘'),
('06-02','06 / 拍摄现场注意事项','清洁工具','准备抹布、手持吸尘器'),
('06-03','06 / 拍摄现场注意事项','设备清洁','拍摄前清理设备及周围空间'),
('06-04','06 / 拍摄现场注意事项','防静电服','员工规范穿着防静电服'),
('06-05','06 / 拍摄现场注意事项','手指套','组装机器时必须佩戴手指套'),
('06-06','06 / 拍摄现场注意事项','员工形象','优先选择年轻、中年且外表形象较好的员工'),
('06-07','06 / 拍摄现场注意事项','员工状态','避免拍摄长痘、痘痘明显的员工'),
('06-08','06 / 拍摄现场注意事项','自动化镜头','有自动化环节时，优先拍摄机器运行画面'),
('06-09','06 / 拍摄现场注意事项','仓库整理','拍摄前整理仓库环境'),
('06-10','06 / 拍摄现场注意事项','机器清洁','擦拭机器，避免灰尘及明显污点'),
('07-01','07 / 照片留档','每个拍摄场地','留存4–5张照片'),
('07-02','07 / 照片留档','人物照片','每个场地包含带人与不带人的照片'),
('07-03','07 / 照片留档','物料仓','拍摄仓库照片'),
('07-04','07 / 照片留档','电池仓','拍摄仓库照片'),
('07-05','07 / 照片留档','4料仓','拍摄仓库照片'),
('07-06','07 / 照片留档','包材仓','拍摄仓库照片'),
('07-07','07 / 照片留档','3楼成品仓','拍摄仓库照片'),
('07-08','07 / 照片留档','2楼成品仓','拍摄仓库照片')
on conflict(id) do nothing;
do $$ begin
 if not exists(select 1 from pg_publication_tables where pubname='supabase_realtime' and schemaname='public' and tablename='checklist_tasks') then
  alter publication supabase_realtime add table public.checklist_tasks;
 end if;
end $$;
