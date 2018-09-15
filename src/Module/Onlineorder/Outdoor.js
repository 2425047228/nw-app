/**
 * 已上门界面组件
 * @author fanyerong
 */
import React, {Component} from 'react';
import Page from '../../UI/Page'
import App from '../Clothes/add_item'
import Nodata from '../../UI/nodata'
import Window from '../../UI/Window';

export default class extends Component {   
    constructor(props) {
        super(props); 
        this.outdoor = ['预约单号','下单时间','衣物名称','件数','合计','客户信息','操作'],
        this.state = {   
            nodatas:false,         
            outdoorlist:[],
            page:1,
            count:0,
            app:false,
            phone:'',
            id:'',
            name:'',
            arritem:[],
            why:'', //取消原因
            index:0, //选择取消原因添加class
            show:false // 取消原因弹框
        };
        //取消订单选项
        this.options = [
            {key:0,value:'商家暂不接单'},
            {key:1,value:'超出服务范围'},
            {key:2,value:'无法提供客户所选服务'},
            {key:3,value:'距离太远'}
        ];   
        this.props.onRef(this);
        this.limit = 10;  
        this.query = this.query.bind(this);   
        this.outdoor_no = this.outdoor_no.bind(this); 
        this.take_clothes = this.take_clothes.bind(this);  
        this.handleclick = this.handleclick.bind(this);
        this.no_btn = this.no_btn.bind(this);             
    };  
    
    //点击选择取消效果和获取原因
    handleclick (e){
        //console.log(e.target.dataset.index || e.target.parentNode.dataset.index);
        var index = e.target.dataset.index ;
        var item = e.target.dataset.item ;
        this.setState({
            index:index,
            why:item,
        });       
    }

    // 显示已上门单列表  
    componentDidMount (){
        this.query() ;     
    }; 
    // 取消预约
    outdoor_no (e){
        var id = e.target.dataset.id;
        this.setState({show:true,id:id})
    }
    //提交取消预约
    no_btn (){
        console.log(this.state.id,this.state.why)
        api.post('cancel_reservation',{
                token:'token'.getData(),
                oid:this.state.id,
                cancel:this.state.why,  
              }, (res,ver) => {     
               if (ver && res) {  
                        tool.ui.success({callback:(close, event) => {
                            close();
                            this.setState({show:false})
                            this.query()
                        }});                               
                }else{
                        tool.ui.error({title:'提示',msg:res.msg,button:'确定',callback:(close, event) => {
                            close();
                        }});
                    }   
              })
    }
    take_clothes (item){
        //var arritem = e.target.dataset.item;
        //console.log(arritem)
        this.setState({
            arritem:item,           
        })
        this.setState({app:true})
    }
    // 网络请求
    query(page, value){
        value = value || '';
        page = page || this.state.page;
        let params= {
            token:'token'.getData(), 
            mid:'mid'.getData(),  
            page:page,
            limit:this.limit,
            value:value,                    
        }
        console.log(params)
        api.post('have_door',params, (res,ver) => {           
            if (ver && res) {
                console.log(res); 
                if(res.result.order.length>0){
                    this.setState({ 
                        count:res.result.count,                     
                        outdoorlist:res.result.order,
                        page:page,
                        nodatas:false
                    })
                    this.props.callParent(res.result.count);
                }else{
                    this.setState({
                        nodatas:true,
                        count:0,
                        outdoorlist:[],
                        page:1
                    })
                    this.props.callParent(res.result.count);
                    console.log('没有客户订单,敬请等待')
                }             
            }
        })
    }   
    render() {  
        var whyshow = this.options.map((obj,index)=>
                 <div data-item={obj.value} data-index={index} className={this.state.index==index?'whyselected':null} onClick = {this.handleclick}>{obj.value}</div>)
        var outdoor = this.outdoor.map((item,index) =><th key={'item'+index}>{item}</th>);       
        var outdoorlist = this.state.outdoorlist.map((item,index) =><tr key={'item'+index} >
            <td>{item.ordersn}</td>
            <td>{item.otime};订单来源:{item.is_online==0? '线下' : '线上' }</td>
            <td>{item.work.map((item,index)=> <span>{item.clothing_name}</span>)}</td>
            <td>{item.work.map((item,index) =><span>{item.work_number}</span>)}</td>
            <td>共{item.count}件,约<i>￥{item.total}</i></td>
            <td index={index}>客户姓名：{item.user_name}<br/>客户电话：{item.user_mobile}<br/> 地址：{item.address}</td>
            <td>
                <s data-id={item.id} onClick = {this.outdoor_no}>取消预约</s>
                <s onClick={() =>this.take_clothes(item)}>收衣</s>
            </td>
        </tr>
        )    
        return (
        <div> 
            <div className="waiting">
                <table className="waiting-list">
                    <thead>
                    <tr>
                        {outdoor}
                    </tr>
                    </thead>
                    <tbody>   
                        {this.state.nodatas&&<Nodata />}                             
                        {outdoorlist}
                    </tbody>
                </table>
            </div>
            {
                this.state.app
                &&
                <App 
                    items={this.state.arritem} 
                    id={this.state.id} 
                    phone={this.state.phone} 
                    name={this.state.name} 
                    closeView={() => {
                        this.query();
                        this.setState({app:false});
                    }}/>
            }
            <Page current={this.state.page} total={this.state.count} fetch={this.limit} callback={page => this.query(page)}/>  
            {                
                this.state.show
                &&               
                <div>
                    <Window  onClose={this.props.closeView} width='340' height='260'>
                        <div className="why-list">
                            {whyshow}
                        </div>
                        <button className="e-btn sure-btn" onClick={this.no_btn}>确定提交</button>
                    </Window>
                </div>               
            }           
        </div>         
        )           
    };
}