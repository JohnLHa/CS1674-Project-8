X_train = set_A_samples;
Y_train = set_A_animals;
model = fitcecoc(X_train, Y_train);
X_test = set_B_samples;
labels = predict(model, X_test);

accuracy = 0;
for i=1:243
    if labels(i) == set_B_animals(i)
        accuracy = accuracy + 1;
    end
end

percent = accuracy / 243 *100;

fprintf('Percent is: %d\n', percent);