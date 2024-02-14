package query;

public class AmountFormatter {

	private static final String[] UNIT_NAMES = {"", "万", "億", "兆", "京", "垓", "𥝱", "穣", "溝", "澗", "正", "載", "極", "恒河沙", "阿僧祇", "那由他", "不可思議", "無量大数"};

    private String amountString;

    public AmountFormatter(String amountString) {
        this.amountString = amountString;
    }

    public String formatAmount() {
        long amount = Long.parseLong(amountString);
        StringBuilder formattedAmount = new StringBuilder();
        int unitIndex = 0;
        while (amount > 0) {
            long currentUnit = amount % 10000;
            if (currentUnit != 0) {
                formattedAmount.insert(0, formatUnit(currentUnit, UNIT_NAMES[unitIndex]));
            }
            amount /= 10000;
            unitIndex++;
        }
        return formattedAmount.toString();
    }

    private static String formatUnit(long amount, String unitName) {
        StringBuilder formattedUnit = new StringBuilder();
        formattedUnit.insert(0, amount);
        formattedUnit.append(unitName);
        return formattedUnit.toString();
    }
}
