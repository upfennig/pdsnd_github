
ny = read.csv('new_york_city.csv')
wa = read.csv('washington.csv')
chi = read.csv('chicago.csv')

library(ggplot2)

head(chi)

dim(chi)

summary(chi)

class(chi$Start.Time)

head(ny)

dim(ny)

head(wa)

dim(wa)

Start.Time_WD = weekdays(as.Date.factor(chi$Start.Time))

head(Start.Time_WD)

ggplot(aes(Start.Time_WD), data=chi)+
  geom_bar()+
  geom_bar(aes(fill=User.Type))+
  xlab('week days')+ylab('number of bike rentals')

ggplot(aes(Start.Time_WD), data=chi)+
  geom_bar(color='blue', fill='blue')+
  xlab('week days')+ylab('number of bike rentals')+
  facet_wrap(~User.Type)

summary(2019-ny$Birth.Year)

summary(ny$Trip.Duration/60)

ggplot(aes(x=2019-Birth.Year, y=Trip.Duration/60), data=subset(ny, !is.na(Birth.Year)))+
  geom_point(alpha=0.05, color='green')+
  coord_cartesian(xlim=c(18,80), ylim=c(1,60))+
  xlab('age')+ylab('trip duration in min')+
  geom_line(stat='summary', fun.y=median)+
  geom_line(stat='summary', fun.y=quantile, fun.args=list(probs=.9), linetype=3, color='red')

summary(wa$User.Type)
by(wa$Trip.Duration/60, wa$User.Type, summary)

qplot(wa$User.Type, wa$Trip.Duration/60, data=wa, geom='boxplot')+
  coord_cartesian(ylim=c(0,100))+
  xlab('Customer types')+ ylab('Trip duration in minutes')

system('python -m nbconvert Explore_bikeshare_data.ipynb')
