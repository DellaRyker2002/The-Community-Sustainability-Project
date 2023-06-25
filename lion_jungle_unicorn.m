% FUNCTION 1: ENERGY USE CALCULATOR
function energyUse = calculateEnergyUse(numAppliances, wattage, hoursUse)

% This function calculates the energy use of a set of appliances with a known
% wattage and hours used per day

totalEnergyUse = 0;

% Iterate through all the appliances
for i = 1:numAppliances
    energyUse = wattage(i) * hoursUse(i);
    totalEnergyUse = totalEnergyUse + energyUse;
end

energyUse = totalEnergyUse;

end

% FUNCTION 2: ENERGY REDUCTION CALCULATOR
function energyReduction = calculateEnergyReduction(numAppliances, wattage, hoursUse, energyEfficiency)

% This function calculates the energy savings from using more energy efficient
% appliances

totalEnergyReduction = 0;

% Iterate through all the appliances
for i = 1:numAppliances
    energyReduction = wattage(i) * hoursUse(i) * (1 - energyEfficiency(i));
    totalEnergyReduction = totalEnergyReduction + energyReduction;
end

energyReduction = totalEnergyReduction;

end

% FUNCTION 3: CARBON EMISSIONS REDUCTION CALCULATOR
function carbonEmissionsReduction = calculateCarbonEmissionsReduction(numAppliances, watts, hours, emissionsReductionRate)

% This function calculates the carbon emissions reduction due to a 
% reduction in energy use

totalCarbonEmissionsReduction = 0;

for i = 1:numAppliances
    carbonEmissionsReduction = watts(i) * hours(i) * emissionsReductionRate;
    totalCarbonEmissionsReduction = totalCarbonEmissionsReduction + carbonEmissionsReduction;
end

carbonEmissionsReduction = totalCarbonEmissionsReduction;

end

% FUNCTION 4: CARBON FOOTPRINT CALCULATOR
function CarbonFootprint = calculateCarbonFootprint(numAppliances, watts, hours, emissionsRate)

% This function calculates the carbon footprint due to energy use from a set of
% appliances

totalCarbonFootprint = 0;

for i = 1:numAppliances
    carbonFootprint = watts(i) * hours(i) * emissionsRate;
    totalCarbonFootprint = totalCarbonFootprint + carbonFootprint;
end

CarbonFootprint = totalCarbonFootprint;

end

% FUNCTION 5: DISPLAY CARBON FOOTPRINT
function displayCarbonFootprint(CarbonFootprint)

% This function displays the carbon footprint to the user

fprintf('Your carbon footprint is %.2f kg of CO2 per year.\n', CarbonFootprint)

end

% FUNCTION 6: DISPLAY CARBON EMISSIONS REDUCTION
function displayCarbonEmissionsReduction(carbonEmissionsReduction)

% This function displays the carbon emissions reduction to the user

fprintf('Your carbon emissions reduction is %.2f kg of CO2 per year.\n', carbonEmissionsReduction)

end

% MAIN FILE

% Initialize user input
numAppliances = input('How many appliances would you like to calculate?  ');
wattage = zeros(1, numAppliances);
hoursUse = zeros(1, numAppliances);
energyEfficiency = zeros(1, numAppliances);
emissionsReductionRate = zeros(1, numAppliances);

% Get user input
fprintf('Please enter the wattage and number of hours used per day for each of your %d appliances.\n', numAppliances);
for i = 1:numAppliances
    wattage(i) = input(sprintf('What is the wattage for appliance %d? ', i));
    hoursUse(i) = input(sprintf('How many hours per day is appliance %d used? ', i));
    energyEfficiency(i) = input(sprintf('What is the energy efficiency for appliance %d (0 to 1)? ', i));
    emissionsReductionRate(i) = input(sprintf('What is the emissions reduction rate for appliance %d (0 to 1)? ', i));
end

% Calculate the energy use and emissions reduction
energyUse = calculateEnergyUse(numAppliances, wattage, hoursUse); 
energyReduction = calculateEnergyReduction(numAppliances, wattage, hoursUse, energyEfficiency);
carbonEmissionsReduction = calculateCarbonEmissionsReduction(numAppliances, wattage, hoursUse, emissionsReductionRate);

% Convert the energy use and emissions reduction to carbon footprint
emissionsRate = 1.222; % kg CO2/kWh
CarbonFootprint = energyUse * emissionsRate;

% Display the carbon footprint and emissions reduction to the user
displayCarbonFootprint(CarbonFootprint);
displayCarbonEmissionsReduction(carbonEmissionsReduction);

% Provide resources and information on sustainable living 
fprintf('The following websites provide resources and information on sustainable living:\n');
fprintf('https://www.energy.gov/energysaver/energy-efficient-products\n');
fprintf('https://www.epa.gov/energy/energy-star-program\n');
fprintf('https://www.sustainability.vic.gov.au/You-and-your-home/Saving-energy\n');