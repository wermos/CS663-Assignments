function [trainingArray, testingArray, galleryImages] = orl_path_loader
    root_path = "../images/ORL/";

    % constants
    NUM_PEOPLE = 32;
    NUM_TRAINING_IMAGES = 6;
    NUM_TESTING_IMAGES = 4;

    % we only need a 1D array
    trainingArray = strings(NUM_PEOPLE * NUM_TRAINING_IMAGES, 1);
    testingArray = strings(NUM_PEOPLE * NUM_TESTING_IMAGES, 2);
    galleryImages = strings(NUM_PEOPLE, 1);

    trainingArrayIdx = uint16(1);
    testingArrayIdx = uint16(1);
    galleryIdx = uint16(1);
    for i = 1:NUM_PEOPLE
        dir_path = append(root_path, "s", int2str(i), "/");
        for j = 1:10
            full_path = append(dir_path, int2str(j), ".pgm");
            if j == 1
                galleryImages(galleryIdx) = full_path;
                galleryIdx = galleryIdx + 1;
            end

            if j <= 6
                trainingArray(trainingArrayIdx) = full_path;
                trainingArrayIdx = trainingArrayIdx + 1;
            else
                testingArray(testingArrayIdx, 1) = full_path;
                % we store the corresponding index so that we can use that
                % info to check if the system correctly recognized the
                % image or not.
                testingArray(testingArrayIdx, 2) = int2str(i);

                testingArrayIdx = testingArrayIdx + 1;
            end
        end
    end
end