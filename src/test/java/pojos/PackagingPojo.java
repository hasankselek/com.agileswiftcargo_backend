package pojos;

public class PackagingPojo {

    private String name;
    private String price;
    private String position;
    private String created_at;
    private String updated_at;
    private int status;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public PackagingPojo(String name, String price, String position, String created_at, String updated_at, int status) {
        this.name = name;
        this.price = price;
        this.position = position;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.status = status;
    }

    public PackagingPojo() {
    }

    @Override
    public String toString() {
        return "PackagingPojo{" +
                "name='" + name + '\'' +
                ", price='" + price + '\'' +
                ", position='" + position + '\'' +
                ", created_at='" + created_at + '\'' +
                ", updated_at='" + updated_at + '\'' +
                ", status=" + status +
                '}';
    }



}
