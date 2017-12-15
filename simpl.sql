
DROP TABLE IF EXISTS `policies`;
CREATE TABLE `policies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255)   NOT NULL,
  `job_submit` tinyint(4) NOT NULL DEFAULT '0',
  `own_data_create` tinyint(4) NOT NULL DEFAULT '0',
  `own_data_read` tinyint(4) NOT NULL DEFAULT '0',
  `own_data_update` tinyint(4) NOT NULL DEFAULT '0',
  `own_data_delete` tinyint(4) NOT NULL DEFAULT '0',
  `oth_data_read` tinyint(4) NOT NULL DEFAULT '0',
  `oth_data_update` tinyint(4) NOT NULL DEFAULT '0',
  `oth_data_delete` tinyint(4) NOT NULL DEFAULT '0',
  `oth_user_read` tinyint(4) NOT NULL DEFAULT '0',
  `oth_user_update` tinyint(4) NOT NULL DEFAULT '0',
  `oth_user_delete` tinyint(4) NOT NULL DEFAULT '0',
  `policy_admin` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `policies_type_unique` (`type`)
);


DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255)  NOT NULL,
  `token` varchar(255)  NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
);

DROP TABLE IF EXISTS `repositories`;
CREATE TABLE `repositories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `alias` varchar(255)  NOT NULL,
  `filename` varchar(255)  NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `path` varchar(255)  DEFAULT NULL,
  `author` int(11) NOT NULL,
  `ispublic` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255)  NOT NULL,
  `email` varchar(255)   NOT NULL,
  `affiliation` varchar(255)   DEFAULT NULL,
  `tel` varchar(255)   DEFAULT NULL,
  `phone` varchar(255)   DEFAULT NULL,
  `verification_code` varchar(255)   DEFAULT NULL,
  `verified` tinyint(4) NOT NULL DEFAULT '0',
  `password` varchar(255)   NOT NULL,
  `remember_token` varchar(100)   DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `policy` varchar(255)   NOT NULL DEFAULT 'user',
  `mypic` varchar(255)   DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
);

DROP TABLE IF EXISTS `vcms_env`;
CREATE TABLE `vcms_env` (
  `var_key` varchar(255)   NOT NULL,
  `var_value` longtext   NOT NULL
);

DROP TABLE IF EXISTS `vcms_job`;
CREATE TABLE `vcms_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  `type` varchar(255)   DEFAULT NULL,
  `qinfo` json DEFAULT NULL,
  `jobdir` varchar(255) DEFAULT NULL,
  `status` varchar(32)   DEFAULT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `jobBefore` json DEFAULT NULL,
  `jobNext` json DEFAULT NULL,
  `input` json DEFAULT NULL,
  `output` json DEFAULT NULL,
  `name` text  ,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `vcms_pages`;
CREATE TABLE `vcms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` text   NOT NULL,
  `alias` text   NOT NULL,
  `contents` longtext   NOT NULL,
  `created` datetime NOT NULL,
  `isfront` tinyint(1) DEFAULT '0',
  `ispublic` tinyint(1) DEFAULT '0',
  `author` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `vcms_plugin`;
CREATE TABLE `vcms_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` text   NOT NULL,
  `role` varchar(255)   NOT NULL,
  `type` varchar(255)   NOT NULL,
  `script` longtext   NOT NULL,
  `includes` longtext   NOT NULL DEFAULT "",
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `alias` varchar(255)   DEFAULT NULL,
  `author` int(11) NOT NULL,
  `ispublic` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `vcms_solvers`;
CREATE TABLE `vcms_solvers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `author` varchar(255)   NOT NULL,
  `execcmd` text   NOT NULL,
  `version` varchar(255)   NOT NULL,
  `name` varchar(255)   NOT NULL,
  `path` varchar(255)   NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);


INSERT INTO `policies` VALUES (1,'admin',1,1,1,1,1,1,1,1,1,1,1,1,'2017-12-04 03:08:37','2017-12-04 23:58:59'),(2,'editor',1,1,1,1,1,1,0,0,0,0,0,0,'2017-12-04 03:45:29','2017-12-06 01:03:50'),(3,'user',1,1,1,1,1,1,0,0,0,0,0,0,'2017-12-04 03:49:03','2017-12-06 21:17:42'),(4,'anonymous',0,0,0,0,0,0,0,0,0,0,0,0,'2017-12-04 03:49:36','2017-12-04 03:49:36');
INSERT INTO `vcms_pages` () VALUES (1,'Main Page','main','{{kCMS|PAGE|nav}}\r\n\r\n<h2>SimPL 1.0b</h2>\r\n<h3>Thank you for participating SimPL development</h3>\r\n\r\n<hr>\r\n<p class=lead>\r\n  SimPL is a Content Management System for Simulation Platforms.<br />\r\n  The objectives of SimPL are :<br />\r\n  - To provide researcher-fiendly(not developer-friendly) development environements <br />\r\n  - To spread researcher\'s precious knowledge(include code, know-how and pre/post processing skills<br />\r\n  - To generate research bigdata for diverse field of research<br />\r\n  - ...<br />\r\n</p>\r\n  <hr />\r\n<p class=lead>\r\n  With SimPL, Simulation Platform Development process can be done with very simple procedure <br />\r\n  1) Design your simulation platform <br />\r\n     - What is the purpose of your platform? (What are you want to offer?) <br />\r\n     - What is the solver(s)?<br />\r\n  	 - What are Input and Output for that?<br />\r\n     - How to execute solver? <br />\r\n  2) Make <mark>Plugins</mark> which prepare input and call your solver <br />\r\n  3) Make Pages which provides user interface for end-user<br />\r\n</p>\r\n  <hr />\r\n<p class=lead>\r\nThere are 2 key components of SimPL<br />\r\n  1) Pages<br />\r\n  \"Page\" is a web page which consists of standard web elements(images, texts, links, input form...) and SimPL web components. <br />\r\n  You can make new page in the <a href=/admin/pages/ target=_blank>\"admin\" menu</a><br />. More detailed documentation can be found in <a href=#page_section>the page section.</a><br />\r\n  \r\n  2) Plugins <br />\r\n  \"Plugin\" is a small program which connects back-end elements(such as solver, linux server,...) to Pages.<br />\r\n  Currently, Plugins are written in Python(2.7.3) and we\'re planing to give more options to SimPL Creators.<br />\r\n  You can make new page in the <a href=/admin/plugins/ target=_blank>\"admin\" menu</a><br />. More detailed documentation can be found in <a href=#plugin_section>the plugin section.</a><br />\r\n  \r\n</p>\r\n\r\n\r\n<h2 id=page_section> Page </h2>\r\n<p class=lead>As described in the introduction section, \"Page\" is a specialized html page for simulation platform.\r\n  You can use typical html tags such as table, div, font,.. and SimPL Web Components to make your \"Page\"<br />\r\n  Please see the content of this \"SimPL Creators Manual\" in the <a href=/admin/pages/modify/1 target=_blank>admin menu</a>\r\n\r\n</p>\r\n<h3>SimPL Web Components</h3>\r\n<h4>VLATOMS : Javascript Atomic Visualizer</h4>\r\n<div style=\'width:500px;height:500px;\'>\r\n{{kCMS|VLATOMS|vla|width:500,height:500}}\r\n    <script>\r\n    $(document).ready(function(){\r\n    vla.Structure={\r\n      a:[5,0,0],\r\n      b:[0,5,0],\r\n      c:[0,0,5],\r\n      atoms:[]\r\n    }\r\n      vla.Structure.atoms.push( new VLatoms.Atom(2.5,2.5,2.5,\"Si\"));\r\n      vla.update.atomsChanged=true;\r\n      vla.update.bondsChanged=true;\r\n      vla.setOptimalCamPosition()\r\n    });\r\n  </script>\r\n</div>\r\n<p class=lead>VLAtoms is web based atomic visualizer. VLAtoms is written by Javascipt and using web-standard components such as Canvas, WebGL and Javascript.<br />\r\n  Thus, Most of modern web brower supports VLAtoms without any plugins.<br />\r\n  You can include VLAtoms into your page with a tag below.<br />\r\n  <code>{ { kCMS|VLATOMS|vla|width:500,height:500} }  (remove space between { and {  )</code> <br />\r\nHere, vla is a name of VLatoms which is used in javascript functions or other page components.<br />\r\n</p>\r\n\r\n<h3>Include Page into other Page</h3>\r\n<p class=lead>\r\n  You can make a page by combination of other pages by code below:<br />\r\n  <code> { { kCMS|PAGE|alias } }</code><br />\r\n  \"alias\" is an alias of other page defined in the <a href=/admin/pages/ target=_blank>page editor</a><br />\r\n</p>\r\n\r\n<h3>Call a plugin using Javascript</h3>\r\n<p class=lead>\r\n  You can connect your page with \"Plugin\" by SimPL JS API. Basically, SimPL JS API is a wrapper of $.ajax function of jQuery.<br />\r\n  Javascript Function <br />\r\n  <code>\r\n    kCMS.callPlugin( [plugin alias], data, [callback function]);\r\n  </code>\r\n  will call a plugin by alias with given data, and callback function will be launched when plugin execution is done.<br />\r\n  In example, <br />\r\n  <code>\r\n    kCMS.callPlugin(\'hellosimpl\',{\'name\':\'Minho Lee\'},function(ret){alert(ret);});\r\n  </code>\r\n  will make alert message \"Hello Minho Lee\".<br />\r\n  Please see source code of this <a href=/admin/pages/modify/1 target=_blank>\"SimPL Creator manual\":line 94~99</a><br />\r\n  <a href=javascript:; onclick=\'pluginTest();\'>Click here to call plugin!</a><br />\r\n  <script>\r\n    function pluginTest(){\r\n      kCMS.callPlugin(\'hellosimpl\',{\'name\':\'Minho Lee\'},function(ret){alert(ret.output);});\r\n    }\r\n  </script>\r\n</p>\r\n<hr>\r\n<h2 id=plugin_section> Plugin </h2>\r\n<p class=lead>As described in the introduction section, Plugin is a simple program. Expeced role of plugins are :<br />\r\n- To prepare input scripts for solver<br />\r\n- To submit job to solver<br />\r\n- To handle atomic structure with complicated modifications<br />\r\n- To parse output files of user\'s job<br />\r\n  ..<br />\r\n</p>\r\n\r\n<p class=lead><mark>Because the plugin is a python script and there\'s no limitation to access server, You shold carefully make your plugin if your plugin writes or deletes some files in the server</mark></p>\r\n\r\n<h3>Plugin workflow</h3>\r\n<p class=lead>When plugin is execued, SimPL automatically generate job directory and python script files.<br />\r\n <code>\r\n+20171211162048_42f21bd7c6afd551972446d7bbf32909<br />\r\n|-kCmsHeader_global.py<br />\r\n|-kCmsHeader_global.pyc<br />\r\n|-kCmsScript__hellosimpl<br />\r\n  </code>\r\n  Here, kCmsHeader_global* script consists of several kCMS functions and user\'s input as a global variable.<br />\r\n</p>\r\n\r\n<h3>Plugin I/O</h3>\r\n<p class=lead>\r\n  User\'s input variables are stored in the global variable <code>kCms[\'input\']</code> so that your plugin can easilly use the user\'s input<br />\r\n  In example, your Page passes \"name\":\"Minho Lee\" as a data for your plugin, kCms[\'input\'] should be <br />\r\n  <code> kCms[\'input\'] = {\'name\':\'Minho Lee\'} </code>. <br />\r\n  You can check example case used at \"Call a plugin using Javascript\" section in the <a href=/admin/plugins/modify/1 target=_blank>Plugin edit menu in admin page</a>.\r\n<br />\r\n  Also, you can export your plugin\'s output via json.dumps function in your plugin.<br />\r\n  In example, <br />\r\n  <code>print json.dumps(\"Hello\"+kCms[\'input\'][\'name\'])</code> <br />\r\n  gives return value of your plugin<br />\r\n</p>\r\n\r\n<h3>Call Plugin from another plugin</h3>\r\n<p class=lead>\r\n  Plugin can be called from another plugin.<br />\r\n  As similar to the \"Call a plugin using Javascript\", You can call other plugin from your plugin by function <br />\r\n  <code>callPlugin(\'[plugin Alias]\',[Input args])</code><br />\r\n  \"callPlugin\" function will return output and error of called plugin as JSON format<br />\r\n  so it is necessary to parse JSON data to Python dictionary like <br />\r\n  <code>output = json.loads( callPlugin(...) )</code>\r\n</p>\r\n\r\n<h3>Built-in function</h3>\r\n\r\n<h4>file_get_contents(string filename)</h4>\r\n<p class=lead>returns contents of file</p>\r\n\r\n<h4>getSolver(integer id)</h4>\r\n<p class=lead>returns information of solver</p>\r\n  \r\n<h4>qsub(object params)</h4>\r\n<p class=lead>submit new job<br />\r\nparams={\r\n  mpi : True|False, #\r\n  solverExec : [execution command for solver], #\r\n  ppn : processors per node,\r\n  nnodes : number of nodes\r\n  \r\n}\r\n</p>\r\n  \r\n<h4>qstat(integer id)</h4>\r\n<p class=lead>returns job status</p>\r\n\r\n<h4>callPlugin(string alias, json data)</h4>\r\n<p class=lead>Call other plugin</p>\r\n\r\n<h4>saveJob(json jobInfo)</h4>\r\n<p class=lead>Save job into Job Database</p>\r\n\r\n<h4>getJobs(json jobInfo)</h4>\r\n<p class=lead>returns Job information</p>','2017-12-11 12:53:20',1,0,1),(2,'SimPL Default navigation bar','nav','<div class=simpl_default_nav style=\'background-color:black;color:white;text-align:right;padding:15px;\'>\r\n  <a href=/admin style=\"color:white;margin-right:15px;\"><i class=\"glyphicon glyphicon-cog\"></i> Admin</a><a style=\"color:white;\" href=/logout><i class=\"glyphicon glyphicon-log-out\"></i> Logout</a>\r\n</div>','2017-12-11 13:13:23',0,0,1);
INSERT INTO `vcms_plugin` (id,name,role,type,script,created_at,updated_at,alias,author,ispublic)  VALUES (1,'Hello SimPL','calculator','python','print json.dumps(\"Hello \"+kCms[\'input\'][\'name\'])','2017-12-11 16:13:25','2017-12-11 16:20:01','hellosimpl',1,0),(2,'[SimPL Example] VASP Job Submit Example','calculator','python','fp=open(\"INCAR\",\"w\");\r\nfp.write(kCms[\'input\'][\'incar\'])\r\nfp.close()\r\nfp=open(\"POSCAR\",\"w\");\r\nfp.write(kCms[\'input\'][\'poscar\'])\r\nfp.close()\r\nfp=open(\"KPOINTS\",\"w\");\r\nfp.write(kCms[\'input\'][\'kpoints\'])\r\nfp.close()\r\nfp=open(\"POTCAR\",\"w\");\r\nfp.write(kCms[\'input\'][\'potcar\'])\r\nfp.close()\r\n\r\n\r\nvasp = getSolver(1)\r\nsolverExec = vasp[\'path\']\r\nqueueParams = {\'mpi\':True,\'solverExec\':solverExec,\'nnodes\':2,\'ppn\':4}\r\nqid = qsub(queueParams)\r\nprint qid','2017-12-14 10:31:17','2017-12-14 12:13:51','simpl_ex_jobsubmit',1,0),(3,'[SimPL Example] Save Job Example','calculator','python','\"\"\"\r\nsaveJob : Save Data to database\r\n  args : object {\r\n    qinfo : , # json parsed queue Information\r\n    input : json, # json parsed Job Input\r\n    output : json, # json parsed Job output\r\n    name : string, # Job Name\r\n  }\r\n  qinfo should have (integer) id field\r\n  i.e,\r\n  qinfo : json.dumps({\"id\" : 12345})\r\n\"\"\"    \r\ndbid = saveJob({\r\n	\"qinfo\" : json.dumps({\"id\":12345}),\r\n    \"input\" : json.dumps({\"inputargs\":\"Hello World\"}),\r\n    \"output\" : json.dumps({})\r\n});\r\nprint json.dumps(dbid)','2017-12-14 11:13:16','2017-12-14 12:12:48','simpl_ex_savejob',1,0),(4,'[SimPL default] Update Job Status','calculator','python','import xmltodict\r\n\r\njoblist = json.loads(getJobs({}))\r\nfor job in joblist:\r\n    jobid = job[\'id\']\r\n    qinfo = job[\'qinfo\']\r\n    try:\r\n        if qinfo == \"\":\r\n            \"\"\r\n        else :\r\n            qinfo = json.loads(job[\'qinfo\'])\r\n            qstat_ret = qstat(qinfo[\'id\'])\r\n            if qstat_ret == \"\":\r\n                if (os.path.isfile(job[\'jobdir\']+\"/finished\")) :\r\n                    qinfo[\'status\'] = \"F\"\r\n                else :\r\n                    qinfo[\'status\'] = \"D\"\r\n            else :\r\n                qjob = xmltodict.parse(qstat_ret)[\'Data\'][\'Job\']\r\n                qinfo[\'status\']=qjob[\'job_state\']\r\n                if qinfo[\'status\'] == \"C\":\r\n                    if (os.path.isfile(job[\'jobdir\']+\"/finished\")) :\r\n                        qinfo[\'status\'] = \"F\"\r\n                    else :\r\n                        qinfo[\'status\'] = \"D\"\r\n                  \r\n            saveJob({\"id\":jobid,\"qinfo\":json.dumps(qinfo),\"jobdir\":job[\'jobdir\']})\r\n\r\n    except Exception as e:\r\n        print e.message\r\n    ','2017-12-14 12:07:14','2017-12-14 12:15:01','updateJobStat',1,0);

