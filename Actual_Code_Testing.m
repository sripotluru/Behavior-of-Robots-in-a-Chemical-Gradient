emptygrid = zeros(50, 50);
emptygrid_1 = zeros(50, 50);
Intensity = 1000;
K = pi;
food = [39 10];
food_1 = [25 25];
for y = 1:50
    for x = 1:50
        r_diagonal = sqrt((x-food(1, 1))^2 + (y-food(1, 2))^2);
%         shape = size(emptygrid);
%         number_of_rows = shape(1, 1)+1;
        emptygrid(y, x) = Intensity/(K*r_diagonal^2);
    end
end

for y = 1:50
    for x = 1:50
        r_diagonal_1 = sqrt((x-food_1(1, 1))^2 + (y-food_1(1, 2))^2);
% %         shape_1 = size(emptygrid_1);
% %         number_of_rows_1 = shape(1, 1)+1;
        emptygrid_1(y, x) = Intensity/(K*r_diagonal_1^2);
    end
end
emptygrid_final = emptygrid + emptygrid_1
% image(emptygrid_final)
% emptygrid_final = (emptygrid_final)'

   
% % obstacle = [24 25]'
emptygrid_final
ant.number = 5;
for i = 1:ant.number
    ant.start(:, 1, i) = [10 5];
end
k = 1;
for i = 1:ant.number
    k = 1;
    movement = randi([-2, 2], 2, 1);

% % for l = 1:2
% %     if l == 2
% %        for y = 1:50
% %            for x = 1:50
% %                r_diagonal_1 = sqrt((x-food_1(1, 1))^2 + (y-food_1(1, 2))^2);
% % %                emptygrid_1(x, y) = Intensity/(K*r_diagonal_1^2);
% % %            end
% % %        end
% % %        emptygrid_final = emptygrid_final + emptygrid_1
% % % 
% % %     end
%     for i = 1:ant.number
%         if l == 1
%             k = 1;
%         else
%             k = 100;
%         end
            
            
    


        for j = 1:100
%             intensity_value_1 = Intensity*(1/2)^j;
%             for y = 1:50
%                 for x = 1:50
%                     r_diagonal_1 = sqrt((x-food_1(1, 1))^2 + (y-food_1(1, 2))^2);
%                     emptygrid_1(x, y) = intensity_value_1/(K*r_diagonal_1^2);
%                 end
%             end
%             emptygrid_final = emptygrid + emptygrid_1;
            
            proposed_movement = ant.start(:, k, i) + movement;
   
   
%             while obstacle == proposed_movement
% %                 while proposed_movement(1,:) <= 0 | proposed_movement(2, :) <= 0 | proposed_movement (1, :) >= 50 | proposed_movement(2, :) >= 50 %| proposed_movement (1, :) == 10 | proposed_movement (2, :) == 10
% %     
% %                 movement = randi([-2, 2], 2, 1);
% %                 proposed_movement = ant.start(:, k, i) + movement;
% %                 
% %                 end
%                 movement = randi([-2, 2], 2, 1);
%                 proposed_movement = ant.start(:, k, i) + movement;
%                 while proposed_movement(1,:) <= 0 | proposed_movement(2, :) <= 0 | proposed_movement (1, :) >= 50 | proposed_movement(2, :) >= 50 %| proposed_movement (1, :) == 10 | proposed_movement (2, :) == 10
%     
%                 movement = randi([-2, 2], 2, 1);
%                 proposed_movement = ant.start(:, k, i) + movement;
%                 
%                 end
%             end
            
            while proposed_movement(1,:) <= 0 | proposed_movement(2, :) <= 0 | proposed_movement (1, :) >= 50 | proposed_movement(2, :) >= 50 %| proposed_movement (1, :) == 10 | proposed_movement (2, :) == 10
    
                movement = randi([-2, 2], 2, 1);
                proposed_movement = ant.start(:, k, i) + movement;
                
            end
            proposed_movement
    
            
            
%            shape_final = size(emptygrid_final);
%            number_of_rows_final = shape_final(1, 1) + 1;
            if emptygrid_final (proposed_movement(2, 1), proposed_movement(1, 1)) > emptygrid_final (ant.start(2, k, i), ant.start(1, k, i))
                ant.start(:, k+1, i) = proposed_movement;
                k = k+1;
               
% %                prob = rand() %Need?
%                if rand()>0.70
%                    movement = movement
%                else
%                    movement = randi([-2, 2], 2, 1);
%                end
               continue
    
    
    
    
                %            m = (ant.start(2, k+1, i) - ant.start(2, k, i))/(ant.start(1, k+1, i) - ant.start(1, k, i))
                %            x = ant.start(1, k+1, i) + 1
                %            y = m*(x - ant.start(1, k+1, i)) - ant.start(2, k+1, i)
                %            k = k+1
            else
    
                movement = randi([-2, 2], 2, 1);
    
            end
%             k = k
        end
end
  
% % emptygrid_final = emptygrid_final.'
image(emptygrid_final); 
colormap; 
hold on 
% % scatter(food(1, 1),food(1, 2), 'black', LineWidth=2); 
% % scatter(food_1(1, 1), food_1(1, 2), 'black', LineWidth=2);
% % hold on
for i=1:ant.number
    scatter(ant.start(1, :, i), ant.start(2, :, i))
    hold on
end
% % for k = 1:200
% %     x = k
% %     y = ant.start(2, k, 1)
% %     z = ant.start(1, k, 1)
% %     surf (x, y, z)
% % end

% %             sqrhypotenuse=(ant.start(1, k-1, i) - ant.start(1, k, i))^2 + (ant.start(2, k-1, i) - ant.start(2, k, i))^2
% %             hypotenuse = sqrt(sqrhypotenuse)
% %             angleinradians = asin((ant.start(2, k-1, i) - ant.start(2, k, i))/hypotenuse)
%             %Move in direction of radians.
%             ant.start(:,k,i) = ant.start(:, k-1, i) + angleinradians()
%         %Add ifelse statement which considers when intensity has reached
%         %highest amount.
%          else
%             ant.start(:, k, i) = ant.start(:, k-1, i) + (rand(2,1) - 0.5)
%          end
%     end
%     k = k+1
% end