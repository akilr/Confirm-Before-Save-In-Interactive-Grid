set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.3.00.05'
,p_default_workspace_id=>1870412561399862
,p_default_application_id=>101
,p_default_owner=>'AKIL_PLUGIN'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/ig_confirm_before_save
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(5380941618395367)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IG_CONFIRM_BEFORE_SAVE'
,p_display_name=>'Interactive Grid - Confirm Before Save'
,p_category=>'INIT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#igConfirmBeforeSave.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin)',
'  return apex_plugin.t_dynamic_action_render_result',
'is',
'  v_return apex_plugin.t_dynamic_action_render_result;',
'begin',
'  v_return.javascript_function := ''confirmBeforeSaveIG.initialize'';',
'  v_return.attribute_01        := p_dynamic_action.attribute_01; --IG Static ID',
'  v_return.attribute_02        := p_dynamic_action.attribute_02; --Confirm Event',
'  v_return.attribute_03        := p_dynamic_action.attribute_03; --Confirm Message',
'',
'  return v_return;',
'end render;',
'  '))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This Dynamic Action Plug-in is used to show a confirm dialog before saving an Interactive Grid. The confirm message can be shown based on the selected DML(Insert/Update/Delete) event.'
,p_version_identifier=>'1.0'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5381185363412500)
,p_plugin_id=>wwv_flow_api.id(5380941618395367)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Region Static ID'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_help_text=>'Static ID of the Interactive Grid Region'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5381472194534084)
,p_plugin_id=>wwv_flow_api.id(5380941618395367)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Event'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'C'
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'The confirm message will appear only for the event selected.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5381739607536723)
,p_plugin_attribute_id=>wwv_flow_api.id(5381472194534084)
,p_display_sequence=>10
,p_display_value=>'Insert'
,p_return_value=>'C'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5382126543538009)
,p_plugin_attribute_id=>wwv_flow_api.id(5381472194534084)
,p_display_sequence=>20
,p_display_value=>'Update'
,p_return_value=>'U'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5382581484539801)
,p_plugin_attribute_id=>wwv_flow_api.id(5381472194534084)
,p_display_sequence=>30
,p_display_value=>'Delete'
,p_return_value=>'D'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5382946625542582)
,p_plugin_attribute_id=>wwv_flow_api.id(5381472194534084)
,p_display_sequence=>40
,p_display_value=>'Insert/Update'
,p_return_value=>'CU'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5383355702544908)
,p_plugin_attribute_id=>wwv_flow_api.id(5381472194534084)
,p_display_sequence=>50
,p_display_value=>'Insert/Delete'
,p_return_value=>'CD'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5383716827547014)
,p_plugin_attribute_id=>wwv_flow_api.id(5381472194534084)
,p_display_sequence=>60
,p_display_value=>'Update/Delete'
,p_return_value=>'UD'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(5384132814549213)
,p_plugin_attribute_id=>wwv_flow_api.id(5381472194534084)
,p_display_sequence=>70
,p_display_value=>'Insert/Update/Delete'
,p_return_value=>'CUD'
,p_is_quick_pick=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(5384528559565669)
,p_plugin_id=>wwv_flow_api.id(5380941618395367)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Confirm Message'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Are you sure that you want to save the changes?'
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A210D0A202A20436F6E6669726D204265666F7265205361766520696E204F7261636C65204150455820496E7465726163746976652047726964202D204F7261636C65204150455820706C7567696E0D0A202A2040617574686F7220416B696C20520D';
wwv_flow_api.g_varchar2_table(2) := '0A202A204076657273696F6E2076312E300D0A202A20406C6963656E7365204D49540D0A202A2F0D0A0D0A76617220636F6E6669726D4265666F7265536176654947203D207B0D0A0D0A092F2F66756E6374696F6E207468617420676574732063616C6C';
wwv_flow_api.g_varchar2_table(3) := '65642066726F6D20706C7567696E0D0A20202020696E697469616C697A653A2066756E6374696F6E2829207B0D0A202020202020202076617220656C656D656E74203D20746869733B0D0A2020202020202020617065782E64656275672E6C6F67282263';
wwv_flow_api.g_varchar2_table(4) := '6F6E6669726D4265666F72655361766549472E696E697469616C697A65222C656C656D656E74293B0D0A2020202020202020766172206967726567696F6E5374617469634964203D20656C656D656E742E616374696F6E2E61747472696275746530312C';
wwv_flow_api.g_varchar2_table(5) := '0D0A202020202020202020202020636F6E6669726D4576656E74203D20656C656D656E742E616374696F6E2E61747472696275746530322C0D0A202020202020202020202020636F6E6669726D4D657373616765203D20656C656D656E742E616374696F';
wwv_flow_api.g_varchar2_table(6) := '6E2E61747472696275746530332C0D0A202020202020202020202020696724203D2020617065782E726567696F6E2822222B6967726567696F6E53746174696349642B2222292E77696467657428292C0D0A20202020202020202020202067726964203D';
wwv_flow_api.g_varchar2_table(7) := '206967242E696E7465726163746976654772696428226765745669657773222C20226772696422292C0D0A2020202020202020202020206D6F64656C203D20677269642E6D6F64656C2C0D0A202020202020202020202020616374696F6E203D20696724';
wwv_flow_api.g_varchar2_table(8) := '2E696E746572616374697665477269642822676574416374696F6E7322292C0D0A20202020202020202020202073617665416374696F6E437573746F6D203D20616374696F6E2E6C6F6F6B757028227361766522292C0D0A202020202020202020202020';
wwv_flow_api.g_varchar2_table(9) := '73617665416374696F6E203D2073617665416374696F6E437573746F6D2E616374696F6E2C0D0A202020202020202020202020736176654576656E743B0D0A202020202020202020202020200D0A20202020202020202020202073617665416374696F6E';
wwv_flow_api.g_varchar2_table(10) := '437573746F6D2E616374696F6E203D2066756E6374696F6E286576656E742C656C297B20202020200D0A202020202020202020202020202020207661722024726567696F6E5374617469634964203D2024282223222B6967726567696F6E537461746963';
wwv_flow_api.g_varchar2_table(11) := '49642B2222292E66696E642822747222292C0D0A2020202020202020202020202020202020202020696E736572746564203D2024726567696F6E53746174696349642E686173436C617373282269732D696E73657274656422292C0D0A20202020202020';
wwv_flow_api.g_varchar2_table(12) := '202020202020202020202020207570646174656420203D2024726567696F6E53746174696349642E686173436C617373282269732D7570646174656422292C0D0A202020202020202020202020202020202020202064656C6574656420203D2024726567';
wwv_flow_api.g_varchar2_table(13) := '696F6E53746174696349642E686173436C617373282269732D64656C6574656422293B0D0A0D0A2020202020202020202020202020202073776974636828636F6E6669726D4576656E74297B0D0A20202020202020202020202020202020202020206361';
wwv_flow_api.g_varchar2_table(14) := '7365202743273A0D0A2020202020202020202020202020202020202020202020207472797B0D0A20202020202020202020202020202020202020202020202020202020736176654576656E74203D20696E7365727465643B0D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(15) := '20202020202020202020202020207D206361746368207B0D0A20202020202020202020202020202020202020202020202020202020617065782E64656275672E6C6F67282243222C736176654576656E74293B0D0A202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(16) := '2020202020202020207D0D0A202020202020202020202020202020202020202020202020627265616B3B0D0A202020202020202020202020202020202020202063617365202755273A0D0A20202020202020202020202020202020202020202020202074';
wwv_flow_api.g_varchar2_table(17) := '72797B0D0A20202020202020202020202020202020202020202020202020202020736176654576656E74203D20757064617465643B0D0A2020202020202020202020202020202020202020202020207D206361746368207B0D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(18) := '202020202020202020202020202020202020617065782E64656275672E6C6F67282255222C736176654576656E74293B0D0A2020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(19) := '20627265616B3B202020200D0A202020202020202020202020202020202020202063617365202744273A0D0A2020202020202020202020202020202020202020202020207472797B0D0A2020202020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(20) := '2020736176654576656E74203D2064656C657465643B0D0A2020202020202020202020202020202020202020202020207D206361746368207B0D0A20202020202020202020202020202020202020202020202020202020617065782E64656275672E6C6F';
wwv_flow_api.g_varchar2_table(21) := '67282244222C736176654576656E74293B0D0A2020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020627265616B3B0D0A20202020202020202020202020202020202020206361';
wwv_flow_api.g_varchar2_table(22) := '736520274355273A0D0A2020202020202020202020202020202020202020202020207472797B0D0A20202020202020202020202020202020202020202020202020202020736176654576656E74203D20696E736572746564207C7C20757064617465643B';
wwv_flow_api.g_varchar2_table(23) := '0D0A2020202020202020202020202020202020202020202020207D206361746368207B0D0A20202020202020202020202020202020202020202020202020202020617065782E64656275672E6C6F6728224355222C736176654576656E74293B0D0A2020';
wwv_flow_api.g_varchar2_table(24) := '202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020627265616B3B0D0A20202020202020202020202020202020202020206361736520274344273A0D0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(25) := '202020202020202020202020207472797B0D0A20202020202020202020202020202020202020202020202020202020736176654576656E74203D20696E736572746564207C7C2064656C657465643B0D0A20202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(26) := '20202020207D206361746368207B0D0A20202020202020202020202020202020202020202020202020202020617065782E64656275672E6C6F6728224344222C736176654576656E74293B0D0A2020202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(27) := '207D0D0A202020202020202020202020202020202020202020202020627265616B3B0D0A20202020202020202020202020202020202020206361736520275544273A0D0A2020202020202020202020202020202020202020202020207472797B0D0A2020';
wwv_flow_api.g_varchar2_table(28) := '2020202020202020202020202020202020202020202020202020736176654576656E74203D2075706461746564207C7C2064656C657465643B0D0A2020202020202020202020202020202020202020202020207D206361746368207B0D0A202020202020';
wwv_flow_api.g_varchar2_table(29) := '20202020202020202020202020202020202020202020617065782E64656275672E6C6F6728225544222C736176654576656E74293B0D0A2020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(30) := '202020202020627265616B3B200D0A2020202020202020202020202020202020202020636173652027435544273A0D0A2020202020202020202020202020202020202020202020207472797B0D0A20202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(31) := '202020202020736176654576656E74203D20696E736572746564207C7C2075706461746564207C7C2064656C657465643B0D0A2020202020202020202020202020202020202020202020207D206361746368207B0D0A2020202020202020202020202020';
wwv_flow_api.g_varchar2_table(32) := '2020202020202020202020202020617065782E64656275672E6C6F672822435544222C736176654576656E74293B0D0A2020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202062';
wwv_flow_api.g_varchar2_table(33) := '7265616B3B202020202020202020202020202020202020202020202020202020200D0A202020202020202020202020202020207D0D0A0D0A20202020202020202020202020202020696628736176654576656E7429207B0D0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(34) := '202020202020202020617065782E6D6573736167652E636F6E6669726D282022222B636F6E6669726D4D6573736167652B22222C2066756E6374696F6E28206F6B507265737365642029207B0D0A20202020202020202020202020202020202020202020';
wwv_flow_api.g_varchar2_table(35) := '2020696628206F6B507265737365642029207B0D0A2020202020202020202020202020202020202020202020202020202073617665416374696F6E286576656E742C656C293B0D0A2020202020202020202020202020202020202020202020207D0D0A20';
wwv_flow_api.g_varchar2_table(36) := '202020202020202020202020202020202020207D293B0D0A202020202020202020202020202020207D200D0A20202020202020202020202020202020656C7365207B0D0A202020202020202020202020202020202020202073617665416374696F6E2865';
wwv_flow_api.g_varchar2_table(37) := '76656E742C656C293B0D0A202020202020202020202020202020207D2020200D0A2020202020202020202020207D0D0A097D200D0A0D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(5385012315645484)
,p_plugin_id=>wwv_flow_api.id(5380941618395367)
,p_file_name=>'igConfirmBeforeSave.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done