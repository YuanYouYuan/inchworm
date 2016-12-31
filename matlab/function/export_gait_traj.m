function export_gait_traj(gait_traj)
    th = rad2deg(gait_traj.th);
    file_name = gait_traj.name;
    csvwrite(['./data/gaits/csv/' file_name '.csv'], th);
    if ispc
        csvwrite(['R:\c\' file_name '.csv'], th);
    end
end
