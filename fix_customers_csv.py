import re

def fix_csv(input_path, output_path):
    # Regular expression to match lines starting with a customer ID (digits followed by a comma)
    customer_id_pattern = re.compile(r'^\d+,')
    current_record = None
    processed_lines = []
    
    with open(input_path, 'r') as infile:
        for line in infile:
            stripped_line = line.strip('\n')
            
            if customer_id_pattern.match(stripped_line):
                # New customer record found
                if current_record is not None:
                    processed_lines.append(current_record)
                current_record = stripped_line
            else:
                # Continuation of the previous line's address field
                if current_record is None:
                    # Handle the header or any initial line not starting with customer_id
                    current_record = stripped_line
                else:
                    # Append with a space to replace the newline
                    current_record += ' ' + stripped_line
        
        # Add the last processed record
        if current_record is not None:
            processed_lines.append(current_record)
    
    # Write the corrected lines to the output file
    with open(output_path, 'w') as outfile:
        for line in processed_lines:
            outfile.write(line + '\n')

# Example usage:
fix_csv('./data/customers.csv', './data/fixed_customers.csv')