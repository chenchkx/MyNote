% GENERATE DATA REPRESENTATION FOR CONNECTED COMPONENT
% REWRITEED BY Kai-Xuan Chen, 
% DATE: 2020.05.03

function out_Y = gen_drsample(zeroEigs_com, dr_com)
    [num_data,num_zeroCom] = size(zeroEigs_com);
    [~,num_drCom] = size(dr_com);
    out_Y = zeros(num_data,num_drCom/num_zeroCom);
    for i =1:num_zeroCom
        i_zeroCom = zeroEigs_com(:,i);
        ind_nonZeroCom = find(i_zeroCom ~= 0);
        tmp_Y = dr_com(ind_nonZeroCom,:);
        ind_iCom = find(tmp_Y(1,:) ~= 0);
        tmp_Y = tmp_Y(:,ind_iCom);
        tmp_Y = tmp_Y + repmat(i_zeroCom(ind_nonZeroCom),1,num_drCom/num_zeroCom);
%         tmp_Y = tmp_Y*sqrt(length(num_data));
        out_Y(ind_nonZeroCom,:) = tmp_Y;    
    end
    out_Y = out_Y';
end