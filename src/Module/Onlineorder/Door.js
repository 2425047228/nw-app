/**
 * 待上门界面组件
 * @author fanyerong
 */
import React, {Component} from 'react';
import Page from '../../UI/Page'
export default class extends Component {   
    constructor(props) {
        super(props); 
        this.door = ['预约单号','下单时间','衣物名称','件数','合计','客户信息','操作'],
        this.state = {            
              doorlist:[],
              page:1,
              count:0,
        }; 
        this.limit = 10;  
        this.query = this.query.bind(this);                
    };         
    // 显示待上门单列表  
    componentDidMount (){        
        this.query();
    }; 
    // 网络请求
    query(page){
        let params= {
            token:'token'.getData(), 
            mid:'mid'.getData(),                     
        }
        console.log(params)
        api.post('come_door',params, (res,ver) => {           
            if (ver && res) {
                console.log(res); 
                if(res.result.count>0){
                    this.setState({  
                        count:res.result.count,                    
                        doorlist:res.result.order,
                    })
                }else{
                    console.log('没有客户订单,敬请等待')
                }             
            }
        })
    }   
    render() {  
        var door = this.door.map((item,index) =><th key={'item'+index}>{item}</th>);       
        var doorlist = this.state.doorlist.map((item,index) =><tr key={'item'+index}>
            <td><span>{item.ordersn}</span></td>
            <td><span>{item.otime};订单来源:{item.is_online==0? '线下' : '线上' }</span></td>
            <td>{
               item.work.map((item,index)=>
                <span>{item.clothing_name}</span>
                )
            }
            </td>
            <td>{
               item.work.map((item,index) =>
                 <span>{item.work_number}</span>
               )
            }
            </td>
            <td><span>共{item.count}件,约<i>￥{item.total}</i></span></td>
            <td index={index}><span>客户姓名：{item.work[0].user_name}<br/>客户电话：{item.work[0].user_mobile}<br/>地址：{item.work[0].address}</span></td>
            <td>
                <s>取消预约</s>
                <s>待上门</s>
            </td>
        </tr>
        )    
        return (
        <div> 
            <div className="waiting">
                <table className="waiting-list">
                    <thead>
                    <tr>
                        {door}
                    </tr>
                    </thead>
                    <tbody>                               
                        {doorlist}
                    </tbody>
                </table>
            </div> 
            <Page current={this.state.page} total={this.state.count} fetch={this.limit} callback={page => this.query(page)}/>
        </div>        
        )           
    };
}