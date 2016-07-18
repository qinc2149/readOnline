var pathName=window.document.location.pathname;    
//获取带"/"的项目名，如：/uimcardprj    
var ctxName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
var optionBar =null;
var myChartBar =null;
$(function(){	
	require.config({
        paths: {
        	echarts: './echarts'
        }
    });
    
    // Step:4 require echarts and use it in the callback.
    // Step:4 动态加载echarts然后在回调函数中开始使用，注意保持按需加载结构定义图表路径
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line'
        ],
        function (ec) {
            //--- 柱 ---
        	myChartBar = ec.init(document.getElementById('right'));
            optionBar={
            	title : {
        	        text: '读者反馈统计'
        	    },
                tooltip : {
                    trigger: 'axis'
                },
                legend: {
                    data:['统计数']
                },
                toolbox: {
                    show : true,
                    orient:'vertical',
                    x:'right',
                    feature : {
                        dataView : {show: true, readOnly: false},
                        saveAsImage : {show: true}
                    }
                },
                xAxis : [
                    {
                        type : 'category',
                        data : []
                    }
                ],
                yAxis : [
                    {
                        type : 'value'
                    }
                ],
                grid:{x:'40',y:'40'},
                series : [
                    {
                        name:'统计数',
                        type:'bar',
                        data:[]
                    }
                ]
            }; 
            //获取柱状图数据
            $.ajax({
    			url : ctxName+'/report/findSum.do',
    			type : 'post',
    			cache : false,
    			success : function(data) {
    				var xData=[];
    				var sData=[];
    				if(data.length>0){
    					for(var i=0;i<data.length;i++){
    						xData[i]=data[i].art_type_name;
    						sData[i]=data[i].feedback_sum;
    					}
    					optionBar.xAxis[0].data=xData;
    					optionBar.series[0].data=sData;
    					myChartBar.setOption(optionBar); 
    				}else{
    					
    				}
    			}
    		});

          //--- 柱 ---
            var myChartLine = ec.init(document.getElementById('left'));
            myChartLine.setOption({
            	 title : {
            	        text: '文章热度指数'
            	    },
            	    tooltip : {
            	        trigger: 'axis'
            	    },
            	    legend: {
            	        data:['励志','言情']
            	    },
            	    toolbox: {
            	        show : true,
            	         orient:'vertical',
            	          x:'right',
            	        feature : {
            	            dataView : {show: true, readOnly: false},
            	            restore : {show: true},
            	            saveAsImage : {show: true}
            	        }
            	    },
            	    calculable : true,
            	    xAxis : [
            	        {
            	            type : 'category',
            	            boundaryGap : false,
            	            data : ['周一','周二','周三','周四','周五','周六','周日']
            	        }
            	    ],
            	    yAxis : [
            	        {
            	            type : 'value',
            	            axisLabel : {
            	                formatter: '{value} 星'
            	            }
            	        }
            	    ],
            	    series : [
            	        {
            	            name:'励志',
            	            type:'line',
            	            data:[1, 4, 3, 2, 5, 2, 1]
            	         
            	        },
            	        {
            	            name:'言情',
            	            type:'line',
            	            data:[2, 4, 2, 5, 3, 2, 5]    
            	        }
            	    ]
            	
            });
            
        });
	 
});