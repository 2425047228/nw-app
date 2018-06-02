/**
 * 下拉框组件
 * @author Edwin Young
 * @desc option:选项列表[value,value,value];onChange:回调操作(value);selected:默认选中的选项
 */

import React from 'react';
export default class extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            selected:'string' === typeof this.props.selected && '' !== this.props.selected ? this.props.selected : null, 
            show:false,
            minWidth:null
        };
        this.handleChange = this.handleChange.bind(this);
        this.toggleShow = this.toggleShow.bind(this);
    } 

    componentDidMount() {
        this.setState({minWidth:68+'px'});
    }

    handleChange(e) {
        let value = e.target.innerText,
            dataValue = e.target.dataset.value;
        this.setState({selected:value, show:false})
        if ('function' === typeof this.props.onChange) {
            'string' === typeof dataValue ? this.props.onChange(dataValue) : this.props.onChange(value);
        }
    }
    toggleShow() {!this.props.readOnly && this.setState({show:!this.state.show})}
    
    render() {
        let len = this.props.option.length,
            option = [];
        let selected = this.state.selected;
        if (null === selected && len > 0) {
            selected = 'string' === typeof this.props.option[0] ? this.props.option[0] : this.props.option[0].value;
        }
        for (let i = 0;i < len;++i) {
            if (null === this.state.selected && 0 === i) {
                continue;
            } else if ('string' === typeof this.props.option[i] && this.state.selected === this.props.option[i]) {
                continue;
            } else {
                if (this.state.selected === this.props.option[i].value) continue;
            }
            if ('string' === typeof this.props.option[i]) {
                option.push(
                    <div
                        key={this.props.option[i] + i}
                        onClick={this.handleChange}
                    >{this.props.option[i]}</div>
                );
            } else {
                option.push(
                    <div
                        key={this.props.option[i].key}
                        data-value={this.props.option[i].key}
                        onClick={this.handleChange}
                    >{this.props.option[i].value}</div>
                );
            }
        }
        return (
            <div
                className={`ui-select${this.state.show ? ' ui-select-show' : ''}${this.props.readOnly ? ' ui-select-readonly' : ''}`}
                style={{minWidth:this.state.minWidth}}
            >
                <i onClick = {this.toggleShow}></i>
                <div
                    className='ui-select-selected'
                    onClick = {this.toggleShow}
                >{selected}</div>
                <div ref={div => this.div = div} className='ui-select-option'>{option}</div>
            </div>
        );
    }
}