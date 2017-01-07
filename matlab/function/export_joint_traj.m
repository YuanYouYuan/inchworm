function export_joint_traj(joint_traj)
    file_name = joint_traj.name;
    csvwrite(['./data/gaits/csv/' file_name '.csv'], joint_traj.th);
    if ispc
        csvwrite(['R:\c\' file_name '.csv'], joint_traj.th);
    end
end
