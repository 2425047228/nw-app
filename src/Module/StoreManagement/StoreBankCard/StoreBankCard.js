import React, {Component} from 'react';
export default class extends Component {   
    constructor(props) {
        super(props); 
        this.state={
            manager:'',
            bank:'',
            account:''
        }  
        this.bankcardsave = this.bankcardsave.bind(this);
    }

    componentDidMount() {
        api.post('bankCard', {token:'token'.getData()}, (res, ver) => {
            if (ver && res) {
                console.log(res)
                this.setState({manager:res.result.manager,
                               bank:res.result.bank,
                               account:res.result.account
                
                });
        
         }
        }
        );
    }
    bankcardsave(){
        api.post('modBankCard', {token:'token'.getData(),
        manager:this.state.manager,
        bank:this.state.bank,
        account:this.state.account
    }, (res, ver) => {
            if (ver && res) {
                console.log(res)
                if (ver && res) {
                    console.log(res)
                    tool.ui.success({callback:(close, event) => {
                        close();
                    }}); 
                }else{
                    tool.ui.error({callback:(close, event) => {
                        close();
                    }});
                }
        
         }
        }
        );
    }
    render(){
        return  (
            <div className="store_management_content_UnionPaycard">
                        
            <p className='store_management_content_title'>门店基本信息</p>
            <div>&emsp;开户行：&emsp;<input type='text' className='e-input store_management_able_input' value={this.state.bank} onChange={e => this.setState({bank:e.target.value})}/></div>
            <div>&emsp;&emsp;姓名：&emsp;<input type='text' className='e-input store_management_able_input' value={this.state.manager} onChange={e => this.setState({manager:e.target.value})}/></div>
            <div>银行卡号：&emsp;<input type='text' className='e-input store_management_able_input' value={this.state.account} onChange={e => this.setState({account:e.target.value})}/></div>
            <button className='e-btn' onClick={this.bankcardsave}>保存</button>
           </div> 
        );
    }
}