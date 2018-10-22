var radarChart = echarts.init(document.getElementById("echarts-radar-chart"));
var radarChart1 = echarts.init(document.getElementById("echarts-radar-chart1"));
var index=0;

knowadge(index);
diffcult(index);


function knowadge(index){
	var radaroption = {
        title : {
            text: index,
            subtext: '知识点对比图'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            orient : 'vertical',
            x : 'right',
            y : 'bottom',
            data:['个人正确率','班级正确率']
        },
        polar : [
           {
               indicator : [
                   { text: '正确率', max: 6000}
                ]
            }
        ],
        calculable : true,
        series : [
            {
                name: index,
                type: 'radar',
                data : [
                    {
                        value : [4300],
                        name : '个人正确率'
                    },
                     {
                        value : [5000],
                        name : '班级正确率'
                    }
                ]
            }
        ]
    };

    radarChart.setOption(radaroption);
    radarChart1.setOption(radaroption);
    $(window).resize(radarChart.resize);	
    $(window).resize(radarChart1.resize);	
}

function diffcult(index){
	var radaroption = {
        title : {
            text: index,
            subtext: '难度对比图'
        },
        tooltip : {
            trigger: 'axis'
        },
        legend: {
            orient : 'vertical',
            x : 'right',
            y : 'bottom',
            data:['个人正确率','班级正确率']
        },
        polar : [
           {
               indicator : [
                   { text: '正确率', max: 6000}
                ]
            }
        ],
        calculable : true,
        series : [
            {
                name: index,
                type: 'radar',
                data : [
                    {
                        value : [4300],
                        name : '预算分配'
                    },
                     {
                        value : [5000],
                        name : '实际开销'
                    }
                ]
            }
        ]
    };

    radarChart.setOption(radaroption);
    radarChart1.setOption(radaroption);
    $(window).resize(radarChart.resize);	
    $(window).resize(radarChart1.resize);	
}


