function out_matrix = process_data(i_nborMatrix, i_data, k_nn, type)
    switch type
        case 'local'
            out_matrix = i_nborMatrix - repmat(i_data,1,k_nn);        
        case 'global'
            out_matrix = i_nborMatrix;
    end
end