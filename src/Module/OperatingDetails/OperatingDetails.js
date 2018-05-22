/**
 * 撤单统计界面组件
 * @author fanyerong
 */
import React, {Component} from 'react';
import '../RevokeData/RevokeData.css';
import './OperatingDetails.css';
import '../../UI/bothpages.css'
export default class extends Component {   
    constructor(props) {
        super(props);           
    }; 
    render() {
       var arr = ['查询','打印','退出'].map((item,index) =><button key={index} data-text={item}>{item}</button>);
       var revokedata_detail = ['流水号','撤单日期','撤单时间','操作店员','撤单原因','撤单类型','原金额','金额','撤单日期','客户电话','客户姓名','上传'].map((item,index)=><span>{item}</span>)
       var revokedata_clothes = ['店员姓名','客户电话','流水号','水洗条码号','衣物编码','衣物名称','衣物颜色','衣物网格','价格','品牌','折后价格','备注','状态','日期','时间','交货定期','交货日期','格架号','是否上传','附加服务','衣物件数','客户姓名'].map((item,index)=><span>{item}</span>)
        return (             
             <div className="bothpagesdata">
                   <div className='bothpages_box'>
                      <div className="bothpages_title">撤单统计<span className="bothpages_close" onClick = {this.props.closeView}></span></div>
                      <div className="revokedata_data OperatingDetails_data">
                         <div className="revokedata_dataLeft OperatingDetails_dataLeft">
                            <div>开始日期：<input type="date" value ='2018-05-19'/></div>
                            <div>类别：<input type="date" value ='2018-05-19'/></div>
                            <div>结束日期：<input type="date" value ='2018-06-19'/></div>
                         </div>
                         <div className="revokedata_dataright OperatingDetails_dataright">
                           {arr}
                         </div>
                      </div>                      
                      <div className="revokedata_list revokedata_last OperatingDetails_list">
                        <div>财务明细<b>共记录 <a>456</a> 条</b></div>
                        <ul className="revokedata_list_box OperatingDetails_list_box">
                            <li id="revokedata_list_box_li">
                                <span></span>
                                 {revokedata_detail}
                            </li>
                            <li>
                                <span>1</span>
                                <span></span>
                                <span></span>
                            </li>
                            <li>
                                <span>2</span>
                                <span></span>
                                <span></span>
                            </li>
                        </ul>
                      </div>
                      <div className="revokedata_list revokedata_last OperatingDetails_list">
                        <div>衣物合计</div>
                        <ul className="revokedata_list_box OperatingDetails_list_box">
                            <li id="revokedata_list_box_li">
                                 <span></span>
                                 {revokedata_clothes}
                            </li>
                            <li>
                                <span>1</span>
                                <span></span>
                                <span></span>
                            </li>
                            <li>
                                <span>2</span>
                                <span>hhhhhhhhhhhhhhhhhh</span>
                                <span></span>
                            </li>
                        </ul>
                      </div>
                   </div>
             </div>
        );
    }
}