class Car:
    def __init__(self, model, color, year, rent_price_nzd, damage_penalty_nzd, offer):
        self.model = model
        self.color = color
        self.year = year
        self.rent_price_nzd = rent_price_nzd
        self.damage_penalty_nzd = damage_penalty_nzd
        self.offer = offer
        self.is_rented = False  # Car availability status

    def __str__(self):
        return (f"Model: {self.model}, Year: {self.year}, Rent: {self.rent_price_nzd} NZD/day, "
                f"Color: {self.color}, Offer: {self.offer}, Damage Penalty: {self.damage_penalty_nzd} NZD")


class RentalBusiness:
    def __init__(self):
        self.car_list = []  # List to store available cars
        self.rented_cars = []  # List to store rented cars
        self.total_earnings = 0  # Track total earnings

    def add_car(self, car):
        self.car_list.append(car)
        print(f"Car {car.model} added to the rental system.")

    def display_all_cars(self):
        print("\nAll Cars in the System:")
        for car in self.car_list:
            print(car)

    def update_penalty(self, model, new_penalty):
        for car in self.car_list:
            if car.model == model:
                car.damage_penalty_nzd = new_penalty
                print(f"Updated damage penalty for {model} to {new_penalty} NZD.")
                return
        print(f"Car {model} not found.")

    def update_offer(self, model, new_offer):
        for car in self.car_list:
            if car.model == model:
                car.offer = new_offer
                print(f"Updated offer for {model} to: {new_offer}.")
                return
        print(f"Car {model} not found.")

    def calculate_total_earnings(self):
        print(f"\nTotal Earnings: {self.total_earnings} NZD")

    def rent_car(self, model):
        for car in self.car_list:
            if car.model == model and not car.is_rented:
                car.is_rented = True
                self.rented_cars.append(car)
                self.total_earnings += car.rent_price_nzd  # Assume 1-day rental for simplicity
                print(f"Car {model} rented successfully!")
                return
        print(f"Car {model} is either not available or already rented.")

    def return_car(self, model):
        for car in self.rented_cars:
            if car.model == model:
                car.is_rented = False
                self.rented_cars.remove(car)
                print(f"Car {model} returned successfully!")
                return
        print(f"Car {model} was not rented out.")

    def view_rented_cars(self):
        print("\nRented Cars:")
        for car in self.rented_cars:
            print(car)


# Main functionality for the rental business
def business_developer_menu():
    business = RentalBusiness()

    # Adding 25 cars to the rental system
    business.add_car(Car("Maruti Suzuki Swift ZXi", "White", 2018, 50, 1200, "Rent for 6 days, get 1 day free"))
    business.add_car(Car("Hyundai i20 Asta (O)", "Fiery Red", 2019, 55, 1400, "10% off for weekend rentals"))
    business.add_car(Car("Tata Nexon XZ+", "Blue", 2017, 60, 1600, "$300 flat rate for a week"))
    business.add_car(Car("Honda City ZX CVT", "Silver", 2016, 65, 1500, "Free GPS for rentals over 5 days"))
    business.add_car(Car("Mahindra Scorpio S11", "Black", 2019, 70, 1800, "Rent for 7 days, get $50 off total"))
    business.add_car(Car("Kia Seltos HTX IVT", "Gravity Grey", 2019, 75, 2000, "5% discount for advance booking (5+ days)"))
    business.add_car(Car("Toyota Innova Crysta 2.4 GX MT", "Super White", 2017, 85, 2200, "Free baby seat for family rentals"))
    business.add_car(Car("Ford EcoSport Titanium", "Canyon Ridge", 2018, 55, 1500, "20% discount for returning customers"))
    business.add_car(Car("Renault Kwid Climber AMT", "Electric Blue", 2019, 45, 1100, "Rent for 5 days, get 1 free"))
    business.add_car(Car("Nissan Magnite XV Premium Turbo", "Blade Silver", 2019, 60, 1500, "10% off for student ID holders"))
    business.add_car(Car("Skoda Rapid Monte Carlo", "Candy White", 2017, 65, 1600, "Free insurance for rentals over 3 days"))
    business.add_car(Car("Volkswagen Polo GT TSI", "Flash Red", 2018, 60, 1400, "$50 off for rentals of 4+ days"))
    business.add_car(Car("MG Hector Sharp DCT", "Burgundy Red", 2019, 75, 2000, "5% off if booked 1 week in advance"))
    business.add_car(Car("Fiat Urban Cross Abarth", "Bronze", 2016, 55, 1500, "Rent 3 days, get 4th day 50% off"))
    business.add_car(Car("Jeep Compass Limited Plus 4x4 AT", "Vocal White", 2018, 95, 2500, "15% off for group bookings (2+ cars)"))
    business.add_car(Car("Mercedes-Benz GLA 200 Sport", "Jupiter Red", 2019, 150, 3500, "Free fuel for first 100 km"))
    business.add_car(Car("BMW X1 sDrive20i SportX", "Mediterranean Blue", 2017, 140, 3300, "10% off for long weekends"))
    business.add_car(Car("Audi Q3 35 TDI Quattro Premium Plus", "Mythos Black", 2016, 160, 3800, "5% discount on rentals over 7 days"))
    business.add_car(Car("Volvo XC40 T4 R-Design", "Crystal White", 2019, 145, 3500, "Free premium sound system on long-term rentals (7+ days)"))
    business.add_car(Car("Jaguar XE Prestige", "Firenze Red", 2018, 180, 4000, "Free pick-up and drop-off for airport rentals"))
    business.add_car(Car("Land Rover Defender 110 SE", "Santorini Black", 2019, 200, 5000, "Free off-road driving kit for weekend rentals"))
    business.add_car(Car("Datsun Go T (O) CVT", "Amber Orange", 2018, 45, 1200, "10% discount for first-time renters"))
    business.add_car(Car("Lexus NX 300h Luxury", "Sonic Titanium", 2019, 180, 4200, "Free full tank of fuel for rentals over 5 days"))
    business.add_car(Car("Chevrolet Beat LT", "Linen Beige", 2015, 40, 1000, "5% off for same-day bookings"))
    business.add_car(Car("Isuzu D-Max V-Cross Z Prestige", "Cosmic Black", 2017, 100, 3000, "Free roadside assistance for rentals over 3 days"))

    while True:
        print("\nBusiness Developer Menu")
        print("1. Display All Cars")
        print("2. Update Damage Penalty")
        print("3. Update Offer")
        print("4. Rent a Car")
        print("5. Return a Car")
        print("6. View Rented Cars")
        print("7. Calculate Total Earnings")
        print("8. Exit")

        choice = input("Select an option (1-8): ")

        if choice == "1":
            business.display_all_cars()
        elif choice == "2":
            model = input("Enter the model of the car to update the penalty: ")
            new_penalty = float(input("Enter the new damage penalty: "))
            business.update_penalty(model, new_penalty)
        elif choice == "3":
            model = input("Enter the model of the car to update the offer: ")
            new_offer = input("Enter the new offer: ")
            business.update_offer(model, new_offer)
        elif choice == "4":
            model = input("Enter the model of the car to rent: ")
            business.rent_car(model)
        elif choice == "5":
            model = input("Enter the model of the car to return: ")
            business.return_car(model)
        elif choice == "6":
            business.view_rented_cars()
        elif choice == "7":
            business.calculate_total_earnings()
        elif choice == "8":
            print("Exiting the system.")
            break
        else:
            print("Invalid selection. Please try again.")

# Run the business developer menu
business_developer_menu()
