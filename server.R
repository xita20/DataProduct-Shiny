library(googleVis)
library(shiny)

###barchat dataset 
data1.1 <- read.csv("data6.1.csv")
data1.2 <- read.csv("data6.2.csv")
data1.3 <- read.csv("data6.3.csv")
data2.1 <- read.csv("data3.1.csv")
###motionchart dataset 
goal1.1<- read.delim("goal6.1.txt")
goal1.2<- read.delim("goal6.2.txt")
goal1.3<- read.delim("goal6.3.txt")
goal2.1<- read.delim("goal3.1.txt")

##geochart dataset 
region<-read.delim("region.txt")

shinyServer(function(input, output) {
  
  mygoal=reactive({input$goal})
  mytarget1=reactive({input$target1})
  mytarget2=reactive({input$target2})
  mytarget3=reactive({input$target3})
  mytarget4=reactive({input$target4})
  mytarget5=reactive({input$target5})
  mytarget6=reactive({input$target6})
  mytarget7=reactive({input$target7})
  mytarget8=reactive({input$target8})
  
  motionchart_data=reactive({
    if(mygoal()=="goal1"&& mytarget1()=="target1.1")
    {data=goal1.1 }    
    else if(mygoal()=="goal1"&& mytarget1()=="target1.2")
    {data=goal1.2}
    else if(mygoal()=="goal1"&& mytarget1()=="target1.3")
    {data=goal1.3}
    else if(mygoal()=="goal2"&& mytarget2()=="target2.1")
    {data=goal2.1}
    else if (mygoal()=="goal3"&& mytarget3()=="target3.1")
    {data=goal3.1}
    else if (mygoal()=="goal4"&& mytarget4()=="target4.1")
    {data=goal4.1}
    else if (mygoal()=="goal5"&& mytarget5()=="target5.1")
    {data=goal5.1}
    else if (mygoal()=="goal5"&& mytarget5()=="target5.2")
    {data=goal5.2}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.1")
    {data=goal6.1}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.2")
    {data=goal6.2}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.3")
    {data=goal6.3}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.1")
    {data=goal7.1}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.2")
    {data=goal7.2}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.3")
    {data=goal7.3}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.4")
    {data=goal7.4}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.1")
    {data=goal8.1}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.2")
    {data=goal8.2}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.3")
    {data=goal8.3}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.4")
    {data=goal8.4}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.5")
    {data=goal8.5}
    
    return(data)
  })
  
  barchart_data=reactive({
    if(mygoal()=="goal1"&& mytarget1()=="target1.1")
    {data2=data1.1 }    
    else if(mygoal()=="goal1"&& mytarget1()=="target1.2")
    {data2=data1.2}
    else if(mygoal()=="goal1"&& mytarget1()=="target1.3")
    {data2=data1.3}
    else if(mygoal()=="goal2"&& mytarget2()=="target2.1")
    {data2=data2.1}
    else if (mygoal()=="goal3"&& mytarget3()=="target3.1")
    {data2=data3.1}
    else if (mygoal()=="goal4"&& mytarget4()=="target4.1")
    {data2=data4.1}
    else if (mygoal()=="goal5"&& mytarget5()=="target5.1")
    {data2=data5.1}
    else if (mygoal()=="goal5"&& mytarget5()=="target5.2")
    {data2=data5.2}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.1")
    {data2=data6.1}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.2")
    {data2=data6.2}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.3")
    {data2=data6.3}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.1")
    {data2=data7.1}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.2")
    {data2=data7.2}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.3")
    {data2=data7.3}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.4")
    {data2=data7.4}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.1")
    {data2=data8.1}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.2")
    {data2=data8.2}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.3")
    {data2=data8.3}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.4")
    {data2=data8.4}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.5")
    {data2=data8.5}
    return(data2)
  })
  
  output$motionchart_country=renderGvis({
    motion=gvisMotionChart(motionchart_data(),idvar="country",timevar="year",options=list(height=490,width=560))
    
  })
  
  geo_region=reactive({
    if(mygoal()=="goal1"&& mytarget1()=="target1.1")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='poverty.degree')}    
    else if(mygoal()=="goal1"&& mytarget1()=="target1.2")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Degree.of.deficit.in.decent.work')}
    else if(mygoal()=="goal1"&& mytarget1()=="target1.3")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Hunger.degree')}
    else if(mygoal()=="goal2"&& mytarget2()=="target2.1")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Primary.school.emrollment.degree')}
    else if (mygoal()=="goal3"&& mytarget3()=="target3.1")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Equal.girls.enrollment.degree.in.primary.school')}
    else if (mygoal()=="goal4"&& mytarget4()=="target4.1")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Under.five.year.olds.mortality.degree')}
    else if (mygoal()=="goal5"&& mytarget5()=="target5.1")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='maternal.motality.degree')}
    else if (mygoal()=="goal5"&& mytarget5()=="target5.2")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Degree.of.access.to.reproductive.health')}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.1")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='HIV.incidence.degree')}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.2")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='missing.data')}
    else if (mygoal()=="goal6"&& mytarget6()=="target6.3")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Tuberculosis.mortality.degree')}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.1")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='missing.data')}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.2")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='missing.data')}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.3")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='sanitation.coverage.degree')}
    else if (mygoal()=="goal7"&& mytarget7()=="target7.4")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Degree.of.proportion.of.slum.dwellers')}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.1")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='missing.data')}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.2")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='missing.data')}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.3")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='missing.data')}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.4")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='missing.data')}
    else if (mygoal()=="goal8"&& mytarget8()=="target8.5")
    {geo=gvisGeoChart(region, locationvar='country', colorvar='Internet.usage.degree')}
    return(geo)
  })
  
  barchart=reactive({
    return(gvisBarChart(barchart_data(), xvar="region", yvar=c("Year1990", "Year2000","Year2010"),options=list(title=as.character(barchart_data()[1,5]),titleTextStyle="{color:'black',fontName:'Courier',fontSize:16}")))
    
  })
  
  output$region_chart=renderGvis({
    return(gvisMerge(geo_region(),barchart(),horizontal=F))
  })
  
})