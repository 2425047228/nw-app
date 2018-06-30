/**
 * 挂失详情页面
 * @author  ranchong
 */
import React, { Component } from 'react';
import Window from '../../UI/Window';
import '../Hangon/Hangon.css'
import './LossReissueChangePublic.css'

export default class extends Component {
    constructor(props) {
        super(props);
        this.remove=this.remove.bind(this);
    };
    remove(){
        api.post('removeLossCard', {
            token:'token'.getData(),
            id:this.props.data.id,
            
        }, (res, ver) => {
            if (ver && res) {
                console.log(res)
                this.props.onClose();
                this.props.refresh();
            }else{
                
            }
        }
    );
    }
    render() {
        var arr = ['发卡店', '发卡店ID', '卡类型', '卡号', '卡ID', '姓名', '手机号', '折扣率', '余额'].map((item, index) => <span key={index} >{item}</span>);
        var count = ['xxxxxx', '102982828228', this.props.data.card_name, this.props.data.recharge_number, this.props.data.cardNumber, this.props.data.user_name, this.props.data.user_mobile, this.props.data.discount, this.props.data.balance].map((item, index) => <span key={index} >{item}</span>);
        return (
            <Window title='解除挂失' onClose={this.props.onClose} width='567' height='382'>
                <p className='loss-rep-title'>原卡信息</p>
                <div className="Hangon-left loss-rep-left">
                    <div className="Hangon-left-title">
                        {arr}
                    </div>
                    <div className="Hangon-left-count">
                        {count}
                    </div>
                </div>
                <div className="loss-rep-right">
                    <p>解除挂失后，该卡将恢复正常使用，您确定要解除挂失吗？</p>
                    <div className='loss-rep-right-btn'>
                        <button className="e-btn" onClick={this.remove}>解除挂失</button>
                        <button className="e-btn">取消</button>
                    </div>
                </div>
            </Window>

        );
    }
}