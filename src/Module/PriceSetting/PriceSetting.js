/**
 * 价格设置
 * @author  wangjun
 */
import React, { Component } from 'react';
import Window from '../../UI/Window';
import CleaningPriceSetting from './CleaningPriceSetting'
import MemberCard from './MemberCard'
import FinishedGoods from './FinishedGoods'
export default class extends Component {
    constructor(props) {
        super(props);
        this.state={index:0};
        this.tab=['会员卡','洗护服务','库存商品'];
        this.views=[<MemberCard/>,<CleaningPriceSetting/>,<FinishedGoods/>];
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
                  <Window title='价格设置' onClose={this.props.closeView}>
                <div className='store_management'>
                    <div className="store_management_tabbar">
                        <div className="Settings-title">
                           {tabs}
                        </div>
                    </div>
                    <div >
                        {this.views[this.state.index]}
                      </div>
                     
                    </div>
                </Window>
            </div>
        );
    }
}