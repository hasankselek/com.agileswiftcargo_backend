package pojos;

public class BlogPojo {

    private String title;
    private int image_id;
    private String description;
    private String position;
    private int status;
    private int created_by;

    @Override
    public String toString() {
        return "BlogPojo{" +
                "title='" + title + '\'' +
                ", image_id=" + image_id +
                ", description='" + description + '\'' +
                ", position='" + position + '\'' +
                ", status=" + status +
                ", created_by=" + created_by +
                ", views='" + views + '\'' +
                ", created_at='" + created_at + '\'' +
                ", updated_at='" + updated_at + '\'' +
                '}';
    }

    public BlogPojo(String title, String updated_at, String created_at, int created_by, String views, String position, int status, String description, int image_id) {
        this.title = title;
        this.updated_at = updated_at;
        this.created_at = created_at;
        this.created_by = created_by;
        this.views = views;
        this.position = position;
        this.status = status;
        this.description = description;
        this.image_id = image_id;
    }

    public BlogPojo() {
    }

    public String getViews() {
        return views;
    }

    public void setViews(String views) {
        this.views = views;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getCreated_by() {
        return created_by;
    }

    public void setCreated_by(int created_by) {
        this.created_by = created_by;
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

    private String views;
    private String created_at;
    private String updated_at;



}
