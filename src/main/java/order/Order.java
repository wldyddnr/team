package order;

public class Order {
	private int oidx;
	private String startDate;
	private String endDate;
	private int ridx;
	private int oPrice;

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public int getoPrice() {
		return oPrice;
	}

	public void setoPrice(int oPrice) {
		this.oPrice = oPrice;
	}

	public int getOidx() {
		return oidx;
	}

	public void setOidx(int oidx) {
		this.oidx = oidx;
	}

	@Override
	public String toString() {
		return "Order [oidx=" + oidx + ", startDate=" + startDate + ", endDate=" + endDate + ", ridx=" + ridx
				+ ", oPrice=" + oPrice + "]";
	}

}
