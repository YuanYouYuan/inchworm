function save_gait_animation(frames, gait)
    vw = VideoWriter(['data/videos/' gait.name '.avi']);
    vw.Quality = 100;
    vw.FrameRate = 100;
    open(vw);
    for i = 2:length(frames)
        writeVideo(vw, frames(i));
    end
    close(vw);
end
