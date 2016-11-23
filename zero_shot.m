testProbs = M(test_ids,:)';
testProbs = testProbs+1;

product = 1;
sizeIds = size(test_ids);

for i=1:sizeIds
    for j=1:243
        for k=1:85
            product = product * attr_probs{k}(j,testProbs(k,i));
        end
        probs(i,j) = product;
        product=1;
    end
end

accuracy = 0;

[~, ind] = max(probs);
ind=ind';

for i=1:243
    finalAttr(i) = test_ids(ind(i));
end

for i=1:243
    if finalAttr(i) == set_B_animals(i)
        accuracy = accuracy + 1;
    end
end

percent = accuracy / 243 *100;

fprintf('Percent is: %d\n', percent);

