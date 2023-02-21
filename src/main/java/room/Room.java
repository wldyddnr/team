package room;

public class Room {

	private int ridx;
	private String type;
	private int price;

	@Override
	public String toString() {
		return "Room [type=" + type + ", price=" + price + "]";
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

}
