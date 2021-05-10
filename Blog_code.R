library(randomForest)
train=read.csv("train.csv")
test=read.csv("test.csv")

model_rf_blue=randomForest(as.factor(blue_wins)~title_bout+B_current_win_streak+
                        B_current_lose_streak+B_wins+B_losses+
                        B_draw+B_Stance+B_Height_cms+B_Reach_cms+B_Weight_lbs+R_current_win_streak+
                        R_current_lose_streak+R_wins+R_losses+R_draw+R_Stance+
                        R_Height_cms+R_Reach_cms+R_Weight_lbs+B_age+R_age
                        ,data=train,na.action = na.exclude)

model_rf_red=randomForest(as.factor(red_wins)~title_bout+B_current_win_streak+
                             B_current_lose_streak+B_wins+B_losses+
                             B_draw+B_Stance+B_Height_cms+B_Reach_cms+B_Weight_lbs+R_current_win_streak+
                             R_current_lose_streak+R_wins+R_losses+R_draw+R_Stance+
                             R_Height_cms+R_Reach_cms+R_Weight_lbs+B_age+R_age
                           ,data=train,na.action = na.exclude)

test$red_wins=predict(model_rf_red,test,type = "prob")
write.csv(test[,c("R_fighter","red_wins")],"Final_Test_Red.csv", row.names=F)

test$blue_wins=predict(model_rf_blue,test, type = "prob")
write.csv(test[,c("B_fighter","blue_wins")],"Final_Test_Blue.csv", row.names=F)
