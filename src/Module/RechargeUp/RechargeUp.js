/**
 * 充值统计界面组件
 * @author fanyerong
 */
import React, {Component} from 'react';
import Window from '../../UI/Window';
import Page from '../../UI/Page';
import Nodata from '../../UI/nodata';
import './RechargeUp.css'

export default class extends Component {   
    constructor(props) {
        super(props);  
        this.state={
            startdate: tool.date('Y-m-01'),
            enddate: tool.date('Y-m-d'),
            total_amount: '0',
            list: [],
            page: 1,
            count: 0,
            nodatas:false,
        }      
        this.limit = 15;
        this.query = this.query.bind(this);   
    }; 
    componentDidMount(){this.query()};
    query(page) {
        
        page = page || this.state.page;
        console.log('页码'+page);
        api.post('rechargeSta', { token: 'token'.getData(), start_time: this.state.startdate, end_time: this.state.enddate,page: page, limit:this.limit }, (res, ver, handle) => {
            if (ver && res) {
                console.log(res);
                this.setState({
                    total_amount: res.result.total_amount || '0',
                    list: res.result.list,
                    count: res.result.count || 0,
                    page: res.result.list.length > 0 ? page : this.state.page,
                    nodatas: res.result.list.length > 0 ? false : true,
                });
            } else {
                handle();
            }
        });
    }
    render() {   

        var list = this.state.list.map((item, index) => <tr key={'item' + index}>
                <td>{index + 1 + (this.state.page - 1) * this.limit}</td>
                <td>{item.recharge_number}</td>
                <td>{item.card_type}</td>
                <td>{item.amount}</td>
                <td>{item.user_name}</td>
                <td>{item.user_mobile}</td>
                <td>{item.time}</td>
            </tr>
        )  
        return ( 
               <Window title='充值统计' onClose={this.props.closeView}>                   
                    <div className="bothpages_list">                                
                        <div className="unpaidstatistics_dataLeft" id="balancestatistics_title_left">
                            <div>开始日期：<input type="date"  value={this.state.startdate} onChange={e=>this.setState({startdate:e.target.value})}/></div>
                            <div>结束日期：<input type="date"  value={this.state.enddate} onChange={e=>this.setState({enddate:e.target.value})}/></div>
                        </div>
                        
                        <button className="e-btn recharg-btn" onClick={()=>this.query(1)}>查询</button>
                        <div id="balancestatistics-zengsong">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</div>
                        <div id="balancestatistics-leiji">累计充值金额：<b>¥{this.state.total_amount}</b> 元</div>
                                                    
                    </div>
                    <table className='ui-table-base bal-sta-tab'>
                        <thead>
                            <tr>
                                <td></td> 
                                <td>卡号</td>
                                <td>卡类型</td>
                                <td>充值金额</td>
                                <td>姓名</td>
                                <td>手机号</td>
                                <td>交易时间</td>
                            </tr>
                        </thead>
                        <tbody>
                            {list}
                            {this.state.nodatas&&<Nodata />}
                        </tbody>  
                    </table>  
                    <Page current={this.state.page} total={this.state.count} fetch = {this.limit} callback={page=> this.query(page)}/>    
                </Window> 
        );            
    };
}