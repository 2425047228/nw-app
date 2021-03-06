/**
 * 设置---门店管理
 * @author ranchong
 */
import React, { Component } from 'react';
import Window from '../../UI/Window';
import './StoreManagement.css'
import StoreInfo from './StoreInfo/StoreInfo';
import StoreBankCard from './StoreBankCard/StoreBankCard'
import StoreOnline from './StoreOnline/StoreOnline'
import StoreConsortiumStore from './StoreConsortiumStore/StoreConsortiumStore'
import StoreSpecialOffers from './StoreSpecialOffers/StoreSpecialOffers'
export default class extends Component {
    constructor(props) {
        super(props);
        this.state={index:0};
        this.tab=['基本信息','结算账号','网店','优惠活动','联营店'];
        this.views=[<StoreInfo/>,<StoreBankCard/>,<StoreOnline/>,<StoreSpecialOffers/>,<StoreConsortiumStore/>];
        this.handleClick=this.handleClick.bind(this);
    };
    handleClick(e){
        this.setState({index:e.target.dataset.index});
    }
    render() {
        let tabs=this.tab.map((item,index)=>
        <span
            key={'item'+index} 
            data-index={index} 
            className={this.state.index==index?'hover':null}
            onClick={this.handleClick}
        >{item}</span>
    );
        return (
            <div>
                <Window title='门店管理' onClose={this.props.closeView}>
                <div className='store_management'>
                    <div className="store_management_tabbar">
                        <div className="Settings-title">
                           {tabs}
                        </div>
                    </div>
                    <div className='store_management_content_all'>
                        {this.views[this.state.index]}
                      </div>                    
                    </div>
                </Window>
            </div>
        );
    };
}